require_relative '../config/environment.rb'
class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all=[]
  def initialize(name)
    @name=name
    @songs = []
  end
  def self.create(name)
    Genre.new(name).tap{|s|s.save}
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

  def artists
    @songs.collect{|s|s.artist}.uniq
  end
end
