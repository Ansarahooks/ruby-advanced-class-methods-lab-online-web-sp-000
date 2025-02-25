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

  def self.new_by_name(song_name)
    song = Song.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = Song.new
    song.name = song_name
    self.all << song
    song
  end

  def self.find_by_name(song_name)
    self.all.find {|song| song.name == song_name }
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(song_filename)
    song = Song.new
    song.name = song_filename.split("-")[1].delete_suffix(".mp3").strip
    song.artist_name = song_filename.split("-")[0].strip
    song
  end

  def self.create_from_filename(song_filename)
    self.new_from_filename(song_filename).save
  end

  def self.destroy_all
    self.all.clear
  end

end
