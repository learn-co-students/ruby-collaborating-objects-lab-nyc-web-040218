class Song
  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(file_name)
    song = Song.new(file_name.split("-")[1][1..-2])
    song.artist = Artist.new(file_name.split("-")[0][0..-2])
    song
  end
end
