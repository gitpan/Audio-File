#!/usr/bin/perl

use Test::More tests => 17;

BEGIN { use_ok('Audio::File'); }

my ${type} = 'Flac';

my $file = Audio::File->new('t/test.'.lc(${type}));
is( ref $file, "Audio::File::${type}", 'Audio::File::new()' );
is( $file->type(), lc $type, 'Audio::File::Type::type()' );

is( ref $file->tag(), "Audio::File::${type}::Tag", "Audio::File::${type}::tag()" );
is( $file->tag()->title(), 'Title', "Audio::File::${type}::Tag::title()" );
is( $file->tag()->artist(), 'Artist', "Audio::File::${type}::Tag::artist()" );
is( $file->tag()->album(), 'Album', "Audio::File::${type}::Tag::album()" );
is( $file->tag()->comment(), 'Comment', "Audio::File::${type}::Tag::comment()" );
is( $file->tag()->genre(), 'Rock', "Audio::File::${type}::Tag::genre()" );
is( $file->tag()->year(), 2005, "Audio::File::${type}::Tag::year()" );
is( $file->tag()->track(), 1, "Audio::File::${type}::Tag::track()" );
is( $file->tag()->total(), 3, "Audio::File::${type}::Tag::total()" );

is( ref $file->audio_properties(), "Audio::File::${type}::AudioProperties", "Audio::File::${type}::audio_properties()" );
is( $file->audio_properties()->length(), 4, "Audio::File::${type}::AudioProperties::length()" );
is( $file->audio_properties()->bitrate(), 91081, "Audio::File::${type}::AudioProperties::bitrate()" );
is( $file->audio_properties()->sample_rate(), 8000, "Audio::File::${type}::AudioProperties::sample_rate()" );
is( $file->audio_properties()->channels(), 1, "Audio::File::${type}::AudioProperties::channels()" );
