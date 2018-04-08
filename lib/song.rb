require 'pry'

class Song

  attr_accessor :name, :artist

  def initialize(name)
    @name = name
    @artist
  end
 
  def self.new_by_filename(song)
    new_song = Song.new(song.split(" - ")[1])
    new_artist = Artist.find_or_create_by_name(song.split(" - ")[0])
    new_song.artist = new_artist
    new_artist.add_song(new_song)
    new_song
  end
  
end