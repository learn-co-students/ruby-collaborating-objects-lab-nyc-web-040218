class Artist

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def self.all
    @@all
  end

  def add_song(song)
    @songs << song
  end

  def save
    @@all << self unless @@all.include?(self)
  end

  def self.find_or_create_by_name(name)
    if self.all.find {|artist| artist.name == name}.nil?
      Artist.new(name)
    else
      return self.all.find {|artist| artist.name == name}
    end
  end

  def print_songs
    @songs.map {|song| puts song.name}
  end

end
