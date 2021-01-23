

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    new_song = Song.new
    @@all << new_song
    return new_song
  end

  def self.new_by_name(name)
    new_song = Song.new
    new_song.name = name
    return new_song
  end

  def self.create_by_name(name)
    new_song = Song.new
    new_song.name = name
    @@all << new_song
    return new_song
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    found_song = self.find_by_name(name) 
    if found_song
      return found_song
    end
    return self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort {|a, b| a.name <=> b.name}
  end

  def self.new_from_filename(filename)
    filename_arr = filename.split(" - ")
    new_song = Song.new
    new_song.name = filename_arr[1].chomp(".mp3")
    new_song.artist_name = filename_arr[0]
    return new_song
  end

  def self.create_from_filename(filename)
    filename_arr = filename.split(" - ")
    new_song = Song.new
    new_song.name = filename_arr[1].chomp(".mp3")
    new_song.artist_name = filename_arr[0]
    @@all << new_song
    return new_song
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end



end
