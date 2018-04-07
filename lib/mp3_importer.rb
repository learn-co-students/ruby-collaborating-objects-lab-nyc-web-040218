require_relative './artist.rb'
require_relative './song.rb'

class MP3Importer
@@all = []
attr_accessor :Artist, :Song, :path
# attr_reader :path

def initialize(test_music_path)
  @path = test_music_path
  @@all << test_music_path
end

def files
  entries = Dir.entries(@path)
  entries[2..5]
end

def import
  # binding.pry
  files.each do |file|
    new_song = Song.new(file.split(" - ")[1])
    new_artist = Artist.find_or_create_by_name(file.split(" - ")[0])
    new_song.artist = new_artist
    new_artist.add_song(new_song)
  end
end
# MP3Importer #import imports the files into the library by creating songs from a filename

end
