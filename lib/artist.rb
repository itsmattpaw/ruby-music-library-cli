require 'pry'

class Artist
    extend Concerns::Findable
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
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
        h = Artist.new(name)
        h.save
        h
    end
    
    #associations
    def songs
        Song.all.collect {|song| song if song.artist == self}
    end
    def add_song(song)
        if song.artist == nil
            song.artist = self
        end
    end
    def genres
        list = Song.all.collect {|song| song.genre if song.artist == self}
        list.uniq
    end
end