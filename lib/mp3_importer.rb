class MP3Importer

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.chdir("#{@path}")
    mp3_files = Dir.glob('*.mp3')
    Dir.chdir("#{Dir.home}/Development/code/ruby-collaborating-objects-lab-nyc-web-040218")
    mp3_files
  end

  def import
    files.each {|file_name| Song.new_by_filename(file_name)}
  end

end


Pry.start
# Dir["*.mp3"]
