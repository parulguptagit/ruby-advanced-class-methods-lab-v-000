class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end
  
  def initialize(name = nil)
    @name = name
  end
  
  def save
    self.class.all << self
  end

  def self.create
    new_song = self.new
    self.all << new_song
    new_song
  end
  
  def self.new_by_name(name)
    new_song = self.new(name)
  end
  
  def self.create_by_name(name)
    new_song = new_by_name(name)
    self.all << new_song
    new_song
  end
  
  def self.find_by_name(name)
    self.all.detect { |song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if song = self.find_by_name(name) == nil
       self.create_by_name(name)
     else
       song
     end
   end
  end
