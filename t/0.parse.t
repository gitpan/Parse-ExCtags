#!/usr/bin/perl 

use Test::Simple tests => 1;
use YAML;

use Parse::ExCtags;

my $tags = exctags(-file => 'tags');

print Dump $tags->tags;

ok(1);

