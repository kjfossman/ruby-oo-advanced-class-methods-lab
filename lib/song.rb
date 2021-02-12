require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize 
   
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
    
  end

  def self.create
    song = self.new
    @@all << song
    return song
  end 
  
  def self.new_by_name(song_name)
    new_song = Song.new
    new_song.name = song_name
    new_song
  end

  def self.create_by_name(song_name)
    new_song = Song.new
    new_song.name = song_name
    new_song.save
    new_song 
  end

  def self.find_by_name(song_name)
    @@all.find do |x|
        x.name == song_name
      end
    end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)   
      return self.find_by_name(song_name)
    else 
      return self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    @@all.sort_by do |x|
      x.name
    end
  end

  def self.new_from_filename(file)
    #Taylor Swift - Blank Space.mp3
    file = file.split(' - ')
    artist = file[0]
    song_name = file[1].split('.mp3')
    new_song = Song.new
    new_song.name = song_name.join
    new_song.artist_name = artist
    new_song
  end

  def self.create_from_filename(file)
    self.new_from_filename(file).save
  end

  def self.destroy_all
    @@all = []
  end

end
