

class Artist

  
  attr_accessor :name 
  attr_reader :songs
  extend Concerns::Findable
  
  
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def save
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(name)
    name = self.new(name)
    name.save
    name
  end
  
  def add_song(song)
    song.artist = self unless song.artist
    @songs << song unless songs.include?(song)
  end
  
  def genres
    @songs.collect {|gNsongs| gNsongs.genre}.uniq
  end
 end