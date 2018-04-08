require "pry"

class MP3Importer

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    files_array = Dir.entries(@path)
    files = files_array.select {|file| file.end_with? "mp3"}
    # or: files.shift(2)
    files
  end

  def import
    files.each do |file|
      new_artist = Artist.find_or_create_by_name(file.split(" - ")[0])
      new_song = Song.new(file.split(" - ")[1])
      new_song.artist = new_artist
      new_artist.add_song(new_song)
    end
  end

end

# Pry.start
# true
