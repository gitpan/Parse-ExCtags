package Parse::ExCtags;
use Spiffy '-base';
use IO::All;

@EXPORT = qw(exctags);

use strict;

field file => '';
field tags => [];
field parsed => 0;

spiffy_constructor 'exctags';

sub paired_arguments { qw(-file) };

sub new {
	my $class = shift;
	my $self = {};
	bless $self,$class;
	my ($args) = $self->parse_arguments(@_);
	$self->file($args->{-file} || 'tags');
	$self->parse;
	return $self;
}

sub parse {
	my($self,$forced) = @_;
	$self->parsed(0) if $forced;
	return $self->tags if($self->parsed);
	my @lines = map {
		{	name => $_->[0],
			file => $_->[1],
			address => $_->[2],
			special => $_->[3], };
	} map [split /\t/,$_,4], (@{io($self->file)});
	$self->parsed(1);
	$self->tags(\@lines);
}

=head1 NAME

Parse::ExCtags - Parse ExCtags format of TAGS file

=head1 SYNOPSIS

    use YAML;
    use Parse::ExCtags;
    my $tags = exctags(-file => 'tags');
    print Dump $tags->tags;

=head1 DESCRIPTION

This module exports a exctags() function that returns a
Parse::ExCtags object. The object has a tags() method 
that return an arrayref of hashref which are tags
presented in the file given by -file argument.

Each hash has following keys:

	name:	the tag name
	file:	the associated file
	adddress: the ex pattern to search this tag
	special: anything behind that is not yet processed

=head1 COPYRIGHT

Copyright 2004 by Kang-min Liu <gugod@gugod.org>.

This program is free software; you can redistribute it and/or
modify it under the same terms as Perl itself.

See <http://www.perl.com/perl/misc/Artistic.html>

=cut


1;

