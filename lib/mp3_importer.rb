require 'pry'
class MP3Importer
  attr_reader :path
  def initialize(path)
    @path = path
  end

  def files
    all_files = Dir.entries(@path)
    all_files.shift(2)
    all_files
  end

  def import
    files.each do |file|
      n_artist = Artist.find_or_create_by_name(file.split(" - ")[0])
      n_song = Song.new(file.split(" - ")[1])
      n_song.artist = n_artist
      n_artist.add_song(n_song)
    end
  end
end
# binding.pry
# "hi"
