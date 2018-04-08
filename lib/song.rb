require 'pry'
class Song

  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(file)
    song_info = file.split(" - ")
    new_song = Song.new(song_info[1])
    new_song.artist_name=(song_info[0])
    new_song.artist.add_song(new_song)
    new_song
  end

  def artist_name=(this_name)
    Artist.find_or_create_by_name(this_name)
    this_artist = Artist.all.find {|artist| artist.name == this_name}
    self.artist = this_artist
  end

end
