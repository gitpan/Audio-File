package Audio::File::MP3::Tag;

use strict;
use warnings;
use base qw( Audio::File::Tag );
use MP3::Tag;

sub init {
	my $self = shift;
	$self->{mp3} = MP3::Tag->new( $self->{filename} ) or return;
	$self->{mp3}->get_tags();

	my ($title, $track, $artist, $album, $comment, $year, $genre) = $self->{mp3}->autoinfo();

	$self->title( $title );
	$self->artist( $artist );
	$self->album( $album );
	$self->comment( $comment );
	$self->genre( $genre );
	$self->year( $year );
	$self->track( $track );

	return 1;
}

1;
