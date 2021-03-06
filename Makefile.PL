use strict;
use warnings;
use inc::Module::Install;
use Module::Install::Authority;

if ($^O eq 'Win32' or $^O eq 'cygwin') {
    print STDERR "This module is not for use on Windows, sorry.";
    exit 0;
}

name 'FCGI-Engine';
all_from 'lib/FCGI/Engine.pm';
license 'perl';
authority 'cpan:STEVAN';

# prereqs
requires 'Moose'                    => 0.93;
requires 'MooseX::Daemonize'        => 0.09;
requires 'MooseX::Getopt'           => 0.26;
requires 'MooseX::Types::Path::Class';
requires 'MooseX::NonMoose';
requires 'Declare::Constraints::Simple';
requires 'FCGI';
requires 'CGI::Simple';
requires 'POSIX';
requires 'Config::Any';
requires 'Class::Load' => '0.20';

feature 'Plack Support',
  -default           => 0,
  'MooseX::NonMoose' => 0.07,
  'Plack'            => 0.9910,
  'FCGI::Client'     => 0.06, # for the tests
  'IO::String'       => 0;    # for the tests

# things the tests need
build_requires 'Test::More' => '0.88';
build_requires 'Test::Exception';
build_requires 'Test::WWW::Mechanize';
build_requires 'File::Spec';
build_requires 'FindBin';
build_requires 'Cwd';

tests('t/*.t');

resources(
    'repository', => 'git://github.com/stevan/fcgi-engine.git',
);

WriteAll();

