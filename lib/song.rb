require 'pry'

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
    song = Song.new
    song.save
    song
  end

  def self.new_by_name (name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name (name)
    song = new_by_name (name)
    song.save
    song
  end

  def self.find_by_name (name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name (name)
    song = find_by_name(name)
    song = create_by_name(name) if song == nil 
    song
  end

  def self.alphabetical
    all_songs = self.all
    all_songs.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    artist_and_song_name = filename.split("-")
    artist = artist_and_song_name[0].delete_suffix(" ")
    song_name = artist_and_song_name[1].delete_suffix('.mp3').delete_prefix(" ")
    song = self.new_by_name(song_name)
    song.artist_name = artist

    song
  end

  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    song.save
  end

  def self.destroy_all
    @@all.clear
  end

end
