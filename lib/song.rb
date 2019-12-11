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
    @@all << song
    song
  end

  def self.new_by_name(song_name)
    song_with_name = Song.new
    song_with_name.name = song_name
    song_with_name
  end

  def self.create_by_name(song_name)
    song_with_name = Song.new
    song_with_name.name = song_name
    @@all << song_with_name
    song_with_name
  end

  def self.find_by_name(song_name)
    self.all.find {|song| song.name == song_name}
  end 

  def self.find_or_create_by_name(song_name)
    if !self.find_by_name(song_name)
      self.create_by_name(song_name)
    else self.find_by_name(song_name)
    end
  end

  def
    self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    artist = filename.split("-")[0].strip
    song = filename.split("-")[1].strip.split(".")[0]
    new_song = self.new
    new_song.name = song
    new_song.artist_name = artist
    new_song
  end
  
  def self.create_from_filename(filename)
    artist = filename.split("-")[0].strip
    song = filename.split("-")[1].strip.split(".")[0]
    new_song = self.new
    new_song.name = song
    new_song.artist_name = artist
    new_song.save
  end

  def self.destroy_all
    self.all.clear
  end

end
