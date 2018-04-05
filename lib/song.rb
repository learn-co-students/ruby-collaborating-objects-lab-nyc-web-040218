class Song

  attr_accessor :name, :artist

  def initialize(name)
    @name = name
  end

  def self.new_by_filename(file)
    song_info = file.split('.')[0].split(' - ')
    song = (Song.new(song_info[1]))
    song.artist = Artist.find_or_create_by_name(song_info[0])
    song
  end

end
