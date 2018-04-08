class Artist

  #rememebr to comman separate
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(a_song)
    a_song.artist = self
    songs << a_song
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(an_artist)
    found_artist = all.find {|artist| artist.name == an_artist}
    if found_artist
      found_artist
    else
       new_artist = self.new(an_artist)
       new_artist.save
       new_artist
    end
  end

  def print_songs
    songs.each {|song| puts song.name}
  end


end
