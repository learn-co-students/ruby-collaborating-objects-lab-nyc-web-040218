require "pry"

class MP3Importer
  attr_accessor :path, :files

  def initialize(path)
    @path = path
  end

  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
  end

  def import
    files.each do |f|
      Song.new_by_filename(f)
      Artist.find_or_create_by_name(f)
    end
  end
end
