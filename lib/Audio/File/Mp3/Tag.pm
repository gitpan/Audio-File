package Audio::File::Mp3::Tag;

use strict;
use warnings;
use base qw( Audio::File::Tag );
use MP3::Tag;

our $VERSION = '0.04';

sub init {
	my $self = shift;
	$self->{mp3} = MP3::Tag->new( $self->{filename} ) or return;
	$self->{mp3}->get_tags();

	my $track = $self->{mp3}->autoinfo()->{track};
	my $pos = index($track, '/');

	$self->title(	$self->{mp3}->{ID3v1}->{song}	);
	$self->artist(	$self->{mp3}->{ID3v1}->{artist}	);
	$self->album(	$self->{mp3}->{ID3v1}->{album}	);
	$self->comment(	$self->{mp3}->{ID3v1}->{comment});
	$self->genre(	$self->{mp3}->{ID3v1}->{genre}	);
	$self->year(	$self->{mp3}->{ID3v1}->{year}	);
	$self->track(	substr($track, 0, $pos)			);
	$self->total(	substr($track, $pos + 1)		);

	return 1;
}

1;
