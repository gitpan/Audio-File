package Audio::File::Ogg;

use strict;
use warnings;
use base qw( Audio::File::Type );
use Audio::File::Ogg::Tag;
use Audio::File::Ogg::AudioProperties;

our $VERSION = '0.01';

sub init {
	my $self = shift;
	$self->{tag} = Audio::File::Ogg::Tag->new( $self->name() ) or return;
	$self->{audio_properties} = Audio::File::Ogg::AudioProperties->new( $self->name() ) or return;
	return 1;
}

1;
