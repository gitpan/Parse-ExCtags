#!/usr/bin/env perl

use Test::Simple tests => 5;
use Parse::ExCtags;

my $tags = exctags(-file => 'tags')->tags;

# Subroutines
foreach(qw/unescape_value parse parse_tagfield paired_arguments/) {
	ok($tags->{$_}->{field}->{kind} eq 'subroutine');
}

# packages
foreach(qw/Parse::ExCtags/) {
	ok($tags->{$_}->{field}->{kind} eq 'package');
}

