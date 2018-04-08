class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir[@path + "/*"].map do |song_file|
      song_file[@path.length+1..-1]
    end
  end

  def import
    self.files.each do |song_file|
      Song.new_by_filename(song_file)
    end
  end
end
