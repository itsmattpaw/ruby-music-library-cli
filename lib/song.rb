require 'pry'

class Song
    extend Concerns::Findable
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

    def self.new_from_filename(file)
        s =  file.split(" - ")
        g = s[2].split(".")
        #binding.pry
        if Song.find_by_name(s[1]) == nil
            item = Song.new(s[1])
            item.artist = Artist.find_or_create_by_name(s[0])
            item.genre = Genre.find_or_create_by_name(g[0])
        end
        item
    end
    def self.create_from_filename(file)
        s = Song.new_from_filename(file)
        s.save
    end
end