require 'pry'
class MP3Importer
  def initialize(filepath)
    @path = filepath
    self.files
  end
  attr_reader :path, :files

  def files
    @files = Dir["#{path}/*"]
    @files.map {|file_name| file_name.slice!("#{path}/")}
    @files
  end

  def import
    @files.each {|file_name| Song.new_by_filename(file_name)}
  end

end
# Pry.start
