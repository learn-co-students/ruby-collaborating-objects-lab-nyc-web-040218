class Song
  attr_reader :name, :artist

  def initialize(name)
    @name = name
  end

  def name=(title)
    @name = title
  end

  def artist=(artist_name)
    @artist = artist_name
  end

  def self.new_by_filename(file_name)
    file_name = file_name.split(" - ")
    song = Song.new(file_name[1])
    song.artist = Artist.find_or_create_by_name(file_name[0])
    song.artist.add_song(song)
    song
  end

end
