package Audio::File::Mp3;

use strict;
use warnings;
use base qw( Audio::File::Type );
use Audio::File::MP3::Tag;
use Audio::File::MP3::AudioProperties;

our $VERSION = '0.03';

sub init {
	my $self = shift;
	$self->{tag} = Audio::File::Mp3::Tag->new( $self->name() ) or return;
	$self->{audio_properties} = Audio::File::Mp3::AudioProperties->new( $self->name() ) or return;
	return 1;
}

1;
