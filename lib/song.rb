class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new  
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    self.all << song
    song
  end

  def self.find_by_name(name)
    @@all.find do |song|
      if song.name == name
        song
      end
    end
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end
  
  def self.all
    @@all
  end

  def self.new_from_filename(name)
    song = self.new
    split = name.split(" - ")
    song.name = split[1].gsub(".mp3", '')
    song.artist_name = split[0]
    song
  end

  def self.create_from_filename(name)
    song = self.create
    split = name.split(" - ")
    song.name = split[1].gsub(".mp3", '')
    song.artist_name = split[0]
    song
  end

  def self.destroy_all
    @@all.clear
  end


  def save
    self.class.all << self
  end

end
