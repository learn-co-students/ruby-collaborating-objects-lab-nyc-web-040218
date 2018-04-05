require 'pry'

class MP3Importer

  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    all_files = Dir.entries("#{@path}").select{|file| file.length > 2}
  end

  def import
    test = files.map do |file|
      song_info = file.split('.')[0].split(' - ')
      song = (Song.new(song_info[1]))
      song.artist = Artist.find_or_create_by_name(song_info[0])
      song.artist.add_song(song)
      song.artist.save
    end
  end

end
