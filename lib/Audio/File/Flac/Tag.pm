package Audio::File::Flac::Tag;

use strict;
use warnings;
use base qw( Audio::File::Tag );
use Audio::FLAC;

our $VERSION = '0.02';

sub init {
	my $self = shift;
	$self->{flac} = Audio::FLAC->new( $self->{filename} ) or return;
	my $flactag = $self->{flac}->tags();

	$self->title(	$flactag->{TITLE}		);
	$self->artist(	$flactag->{ARTIST}		);
	$self->album(	$flactag->{ALBUM}		);
	$self->comment(	$flactag->{DESCRIPTION}	);
	$self->genre(	$flactag->{GENRE}		);
	$self->year(	$flactag->{DATE}		);
	$self->track(	$flactag->{TRACKNUMBER}	);
	$self->total(	$flactag->{TRACKTOTAL}	);

	return 1;
}

1;
