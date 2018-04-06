require 'pry'
class Artist
  attr_accessor :name, :songs
  @@all = []
  def initialize(name)
    @name = name
    @songs = []
    save
    # binding.pry
  end

  def add_song(song_name)
    @songs << song_name
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.find_or_create_by_name(name)
    # binding.pry
    if @@all.any?{|artist|artist.name == name}
      @@all.find{|artist| artist.name == name}
    else
      Artist.new(name)
    end
  end

  def print_songs
    @songs.each do |song|
      puts song.name
    end
  end

end
