class Artist
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song_instance)
    @songs << song_instance
  end

  def save
    @@all << self
  end

  def songs
    @songs
  end

  def print_songs
    @songs.each do |song_instance|
      puts song_instance.name
    end
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(artist_name)
    is_artist_instance_exists = self.all.any? do |artist_instance|
      artist_instance.name == artist_name
    end

    if !is_artist_instance_exists
      artist = Artist.new(artist_name)
      artist.save
      artist
    end
  end
end
