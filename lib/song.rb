require 'pry'

class Song
    attr_accessor :name, :artist, :genre
    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name
        self.artist = (artist) if artist != nil
        self.genre = (genre) if genre != nil
    end
    def self.all
        @@all
    end
    def save
        @@all << self
    end
    def self.destroy_all
        @@all.clear
    end
    def self.create(name)
        h = Song.new(name)
        h.save
        h
    end
    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end
    def genre=(genre)
        if @genre == nil
            @genre = genre
        end
    end

    #findable methods
    def self.find_by_name(name)
        @@all.find {|song| song if song.name == name}
    end
    #binding.pry
    def self.find_or_create_by_name(name)
        song = self.find_by_name(name)
        if song == nil
            self.create(name)
        else
            song
        end
    end
end