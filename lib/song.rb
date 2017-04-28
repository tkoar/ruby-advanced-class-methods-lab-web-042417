require "pry"

class Song
  attr_accessor :name, :artist_name

  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(string)
    song = self.new
    song.name = string
    song
  end

  def self.create_by_name(string)
    song = self.create
    song.name = string
    song
  end

  def self.find_by_name(name)
    self.all.detect { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by { |e| e.name }
  end

  def self.new_from_filename(song)
    song_array = song.split(" - ")
    a = song_array[0]
    song_name = song_array[1][0...-4]
    new_song = self.new_by_name(song_name)
    new_song.artist_name = a
    new_song
  end

  def self.create_from_filename(string)
    song = self.new_from_filename(string)
    a_song = self.create
    a_song.artist_name = song.artist_name
    a_song.name = song.name
    a_song
  end

  def self.destroy_all
    self.all.clear
  end



end
