require 'pry'

class Genre
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
        h = Genre.new(name)
        h.save
        h
    end

    #associations
    def songs
        Song.all.collect {|song| song if song.genre == self}
    end
    def artists
        list = Song.all.collect {|song| song.artist if song.genre == self}
        list.uniq
    end
end