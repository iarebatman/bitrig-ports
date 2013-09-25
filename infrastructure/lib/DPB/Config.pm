# ex:ts=8 sw=4:
# $OpenBSD: Config.pm,v 1.11 2013/09/25 07:01:35 espie Exp $
#
# Copyright (c) 2010 Marc Espie <espie@openbsd.org>
#
# Permission to use, copy, modify, and distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

use strict;
use warnings;

# all the code responsible for handling command line options and the
# config file.

package DPB::Config;
sub parse_command_line
{
	my ($class, $state) = @_;
	$state->{dontclean} = {};
	$state->{opt} = {
		A => sub {
			$state->{arch} = shift;
		},
		L => sub {
			$state->{flogdir} = shift;
		},
		l => sub {
			$state->{flockdir} = shift;
		},
		r => sub {
			$state->{random} = 1;
			$state->heuristics->random;
		},
		P => sub {
			push(@{$state->{paths}}, shift);
		},
		I => sub {
			push(@{$state->{ipaths}}, shift);
		},
		C => sub {
			push(@{$state->{cpaths}}, shift);
		},
		X => sub {
			push(@{$state->{xpaths}}, shift);
		},
		b => sub {
			push(@{$state->{build_files}}, shift);
		},
		h => sub {
			push(@{$state->{config_files}}, shift);
		},
	};

	$state->SUPER_handle_options('acemqrRstuUvh:S:xX:A:B:C:f:F:I:j:J:M:p:P:b:l:L:',
    "[-acemqrRsuUvx] [-A arch] [-B chroot] [-C plist] [-f m] [-F m]",
    "[-I pathlist] [-J p] [-j n] [-p parallel] [-P pathlist] [-h hosts]",
    "[-L logdir] [-l lockdir] [-b log] [-M threshold] [-X pathlist]",
    "[pathlist ...]");
    	$state->{fullrepo} = join("/", $state->{repo}, $state->arch, "all");
	$state->{logdir} = $state->{flogdir} // $ENV{LOGDIR} // '%p/logs/%a';
	$state->{lockdir} //= $state->{flockdir} // "%L/locks";
	if (defined $state->{opt}{F}) {
		if (defined $state->{opt}{j} || defined $state->{opt}{f}) {
			$state->usage("Can't use -F with -f or -j");
		}
		$state->{fetch_only} = 1;
		$state->{opt}{f} = $state->{opt}{F};
		$state->{opt}{j} = 1;
		$state->{opt}{e} = 1;
	}
	if (defined $state->opt('j')) {
		if ($state->localarch ne $state->arch) {
			$state->usage(
		    "Can't use -j if -A arch is not local architecture");
		}
		if ($state->opt('j') !~ m/^\d+$/) {
			$state->usage("-j takes a numerical argument");
		}
	}
	if (defined $state->{config_files}) {
		for my $f (@{$state->{config_files}}) {
			$f = $state->expand_path($f);
		}
	}

	$state->{logdir} = $state->expand_path($state->{logdir});
	$state->{size_log} = "%f/build-stats/%a-size";

	# keep cmdline subst values
	my %cmdline = %{$state->{subst}};
	$class->parse_config_files($state);
	# ... as those must override the config files contents
	while (my ($k, $v) = each %cmdline) {
		$state->{subst}->{$k} = $v;
	}

	if ($state->define_present("STARTUP")) {
		$state->{startup_script} = $state->{subst}->value("STARTUP");
	}
	if ($state->define_present('LOGDIR')) {
		$state->{logdir} = $state->subst->value('LOGDIR');
	}
	if ($state->define_present('WANTSIZE')) {
		$state->{wantsize} = $state->{subst}->value('WANTSIZE');
	}
	if ($state->define_present('FETCH_JOBS') && !defined $state->{opt}{f}) {
		$state->{opt}{f} = $state->{subst}->value('FETCH_JOBS');
	}
	if ($state->define_present('LOCKDIR')) {
		$state->{lockdir} = $state->{subst}->value('LOCKDIR');
	}
	if ($state->define_present('TESTS')) {
		$state->{tests} = $state->{subst}->value('tests');
	}
	if ($state->{flogdir}) {
		$state->{logdir} = $state->{flogdir};
	}
	if ($state->{flockdir}) {
		$state->{lockdir} = $state->{flockdir};
	}
	if ($state->{opt}{t}) {
		$state->{tests} = 1;
	}
	if ($state->{opt}{s}) {
		$state->{wantsize} = 1;
	}

	$state->{opt}{f} //= 2;
	if ($state->opt('f') !~ m/^\d+$/) {
		$state->usage("-f takes a numerical argument");
	}
	if ($state->opt('f')) {
		$state->{want_fetchinfo} = 1;
	}
	if (!$state->{subst}->empty('HISTORY_ONLY')) {
		$state->{want_fetchinfo} = 1;
		$state->{opt}{f} = 0;
		$state->{opt}{j} = 1;
		$state->{opt}{e} = 1;
		$state->{all} = 1;
		$state->{scan_only} = 1;
		# XXX not really random, but no need to use dependencies
		$state->{random} = 1;
	}

	# redo this in case config files changed it
	$state->{logdir} = $state->expand_path($state->{logdir});

	if ($state->define_present("RECORD")) {
		$state->{record} = $state->expand_path($state->{subst}->value("RECORD"));
	}
	$state->{size_log} = $state->expand_path($state->{size_log});
	$state->{lockdir} = $state->expand_path($state->{lockdir});
	if (!$state->{subst}->value("NO_BUILD_STATS")) {
		push @{$state->{build_files}}, "%f/build-stats/%a";
	}
	for my $cat (qw(build_files paths ipaths cpaths xpaths)) {
		next unless defined $state->{$cat};
		for my $f (@{$state->{$cat}}) {
			$f = $state->expand_path($f);
		}
	}
	$state->{permanent_log} = $state->{build_files}[-1];
	$state->{display_timeout} =
	    $state->{subst}->value('DISPLAY_TIMEOUT') // 10;
	$state->{build_once} = $state->{all};
	if ($state->defines("DONT_BUILD_ONCE")) {
		$state->{build_once} = 0;
	}
	if ($state->define_present('MIRROR')) {
		$state->{mirror} = $state->{subst}->value('MIRROR');
	} else {
		$state->{mirror} = $state->{fetch_only};
	}
}

sub command_line_overrides
{
	my ($class, $state) = @_;

	my $override_prop = DPB::HostProperties->new;

	if ($state->opt('j')) {
		$override_prop->{jobs} = $state->opt('j');
	}
	if ($state->opt('p')) {
		$override_prop->{parallel} = $state->opt('p');
	}
	if ($state->opt('B')) {
		$override_prop->{chroot} = $state->opt('B');
	}
	if ($state->define_present('STUCK_TIMEOUT')) {
		$override_prop->{stuck} = 
		    $state->{subst}->value('STUCK_TIMEOUT');
	}
	if ($state->define_present('FETCH_TIMEOUT')) {
		$override_prop->{fetch_timeout} = 
		    $state->{subst}->value('FETCH_TIMEOUT');
	}
	if ($state->define_present('SMALL_TIME')) {
		$override_prop->{small} = 
		    $state->{subst}->value('SMALL_TIME');
	}
	if ($state->define_present('CONNECTION_TIMEOUT')) {
		$override_prop->{timeout} = 
		    $state->{subst}->value('CONNECTION_TIMEOUT');
	}
	if ($state->opt('J')) {
		$override_prop->{junk} = $state->opt('J');
	}
	if ($state->defines("ALWAYS_CLEAN")) {
		$override_prop->{always_clean} = 1;
	}
	if ($state->opt('M')) {
		$override_prop->{mem} = $state->opt('M');
	}

	if ($state->define_present('SYSLOG')) {
		require Sys::Syslog;
		Sys::Syslog::openlog('dpb', "nofatal");
		$override_prop->{syslog} = 1;
	}
	return $override_prop;
}

sub parse_config_files
{
	my ($class, $state) = @_;

	my $override_prop = $class->command_line_overrides($state);
	my $default_prop = {
		junk => 150, 
		parallel => '/2',
		small => 120,
		repair => 1,
		nochecksum => 1,
	};

	if ($state->{config_files}) {
		for my $config (@{$state->{config_files}}) {
			$class->parse_hosts_file($config, $state, 
			    $default_prop, $override_prop);
		}
	}
	$state->{default_prop} = $default_prop;
	$state->{override_prop} = $override_prop;
	if (!$state->{config_files}) {
		my $prop = DPB::HostProperties->new($state->{default_prop});
		$prop->add_overrides($state->{override_prop});
		DPB::Core::Init->new('localhost', $prop);
	}
}

sub parse_hosts_file
{
	my ($class, $filename, $state, $default, $override) = @_;
	open my $fh, '<', $filename or
		$state->fatal("Can't read host files #1: #2", $filename, $!);
	my $_;
	my $cores = {};
	while (<$fh>) {
		chomp;
		s/\s*\#.*$//;
		next if m/^$/;
		if (m/^([A-Z_]+)\=\s*(.*)\s*$/) {
			$state->{subst}->add($1, $2);
			next;
		}
		# copy default properties
		my $prop = DPB::HostProperties->new($default);
		my ($host, @properties) = split(/\s+/, $_);
		for my $_ (@properties) {
			if (m/^(.*?)=(.*)$/) {
				$prop->{$1} = $2;
			}
		}
		if (defined $prop->{arch} && $prop->{arch} ne $state->arch) {
			next;
		}
		if ($host eq 'DEFAULT') {
			$default = { %$prop };
			next;
		}
		$prop->add_overrides($override);
		$state->heuristics->calibrate(DPB::Core::Init->new($host,
		    $prop));
	}
}

package DPB::HostProperties;

my $has_sf = 0;
my $sf;

sub new
{
	my ($class, $default) = @_;
	$default //= {};
	bless {%$default}, $class;
}

sub add_overrides
{
	my ($prop, $override) = @_;
	while (my ($k, $v) = each %$override) {
		$prop->{$k} = $v;
	}
	$sf //= $prop->{sf};
	if (defined $prop->{sf} && $prop->{sf} != $sf) {
		$has_sf = 1;
	}
}

sub has_sf
{
	return $has_sf;
}

my $default_user;
sub finalize
{
	my ($class, $prop) = @_;
	$prop->{sf} //= 1;
	$prop->{umask} //= sprintf("0%o", umask);
	if (defined $prop->{stuck}) {
		$prop->{stuck_timeout} = $prop->{stuck} * $prop->{sf};
	}
	if (defined $prop->{mem}) {
		$prop->{memory} = $prop->{mem};
	}
	if (defined $prop->{chroot}) {
		if ($prop->{chroot} eq '/' || $prop->{chroot} eq '') {
			delete $prop->{chroot};
		} else {
			if (!defined $prop->{chroot_user}) {
				if (!defined $default_user) {
					$default_user = `whoami`;
					chomp($default_user);
				}
			}
			$prop->{chroot_user} = $default_user;
		}
	}
	if (defined $prop->{memory}) {
		my $_ = $prop->{memory};
		if (s/K$//) {
		} elsif (s/M$//) {
			$_ *= 1024;
		} elsif (s/G$//) {
			$_ *= 1024 * 1024;
		}
		$prop->{memory} = $_;
	}
	$prop->{small} //= 120;
	$prop->{small_timeout} = $prop->{small} * $prop->{sf};
	return $prop;
}

1;
