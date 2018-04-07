require_relative './artist.rb'
require_relative './mp3_importer'
require 'pry'
class Song
attr_accessor :name, :artist

@@all=[]

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.new_by_filename(song)
    # binding.pry
    new_song_name = Song.new(song.split(" - ")[1]) #Black or White
      new_artist_name = Artist.find_or_create_by_name(song.split(" - ")[0]) #Michael Jackson
        new_song_name.artist = new_artist_name
    new_artist_name.add_song(new_song_name)
    new_song_name
  end

  def self.all
    @@all
  end

  def self.song_name
    @name
  end

end
