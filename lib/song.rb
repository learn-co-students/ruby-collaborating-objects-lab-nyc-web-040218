require 'pry'

class Song
  attr_accessor :name, :artist
  def initialize(name)
    @name = name
    @artist
  end

  def self.new_by_filename(song)
    # binding.pry
    n_song = Song.new(song.split(" - ")[1])
    n_artist = Artist.find_or_create_by_name(song.split(" - ")[0])
    n_song.artist = n_artist
    n_artist.add_song(n_song)
    n_song
  end
end
