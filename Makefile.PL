use v5.10;
use strict;
use warnings FATAL => 'all';
use inc::Module::Install;

name 'HTTP-Status-Constants';
all_from 'lib/HTTP/Status/Constants.pm';
license 'artistic_2';

perl_version 5.010;

tests_recursive('t');

# tests_recursive('xt');

resources(
    homepage   => 'http://rrwo.tumblr.com',
    license    => 'http://www.perlfoundation.org/artistic_license_2_0',
    repository => 'git://github.com/robrwo/HTTP-Status-Constants.git',
    bugtracker => 'https://github.com/robrwo/HTTP-Status-Constants/issues',
);

configure_requires();

build_requires();

requires(
    'Const::Exporter' => 0,
    'HTTP::Status'    => 0,
    'Package::Stash'  => 0,
    'version'         => 0.77,
);

recommends(
    'Package::Stash::XS' => 0,
    'Storable'           => 0,
);

test_requires(
);

install_as_cpan;
auto_install;
WriteAll;
