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

  def self.new_by_name(name)
  song = Song.new
  song.name = name
  song
end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end


  def self.find_by_name(name)
    self.all.detect do |song|
      song.name == name
  end
end

  def self.find_or_create_by_name(name)
  if self.find_by_name(name) == nil
    self.create_by_name(name)
  else
    self.find_by_name(name)
  end
end

def self.alphabetical
 self.all.sort_by {|song| song.name}
end

def self.new_from_filename(file_name)
array = file_name.split(/[-.]/)
song_name = array[1].strip
artist = array[0].strip
song = self.new_by_name(song_name)
song.artist_name = artist
song
# binding.pry
end

def self.create_from_filename(file_name)
  array = file_name.split(/[-.]/)
  song_name = array[1].strip
  artist = array[0].strip
  song = self.create_by_name(song_name)
  song.artist_name = artist
  song
end

def self.destroy_all
 self.all.clear
end


end


# p "Thundercat - For Love I Come.mp3".split(/[-.]/)
# ["Thundercat ", " For Love I Come", "mp3"]
