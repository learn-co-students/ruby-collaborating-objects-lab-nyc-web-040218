require_relative './song.rb'
require_relative './mp3_importer'
require 'pry'
class Artist

attr_accessor :name, :song, :songs

@@all =[]

  def initialize(name)
    @name = name
    @song = song
    @@all << self
    @songs = []
  end

  def add_song(song)
    song.artist = self
    @songs << song
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

def self.find_or_create_by_name(name)
  if @@all.any? do |artist|
    artist.name == name
    end
      @@all.find do |artist|
        artist.name == name
      end
  else
    Artist.new(name)
  end
end

  def print_songs
    @songs.each do |song|
      puts song.name
    end
  end

  # describe '.find_or_create_by_name' do
  #   it 'finds or creates an artist by name maintaining uniqueness of objects by name property' do
  #     artist_1 = Artist.find_or_create_by_name("Michael Jackson")
  #     artist_2 = Artist.find_or_create_by_name("Michael Jackson")
  #     expect(artist_1).to eq(artist_2)
end
