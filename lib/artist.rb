class Artist
  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end

  def name=(name)
    @name = name
  end

  def add_song(song)
    @songs << song
  end

  def songs
    @songs
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_artist_by_name(name)
    all.find {|artist| artist.name.include?(name)}
  end

  def self.find_or_create_by_name(name)
    if find_artist_by_name(name) == nil
      Artist.new(name)
    else
      find_artist_by_name(name)
    end
  end

  def print_songs
    self.songs.each {|song| puts song.name}
  end

end
