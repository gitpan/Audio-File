package Audio::File::Flac::AudioProperties;

use strict;
use warnings;
use base qw( Audio::File::AudioProperties );
use Audio::FLAC;

our $VERSION = '0.01';

sub init {
	my $self = shift;
	$self->{flac} = Audio::FLAC->new( $self->{filename} ) or return;
	my $flacinfo = $self->{flac}->info();

	$self->length( $self->{flac}->{trackTotalLengthSeconds} );
	$self->bitrate( $self->{flac}->{bitRate} );
	$self->sample_rate( $flacinfo->{SAMPLERATE} );
	$self->channels( $flacinfo->{NUMCHANNELS} );
	
	return 1;
}

1;
