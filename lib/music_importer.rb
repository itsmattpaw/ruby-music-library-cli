require 'pry'

class MusicImporter
    attr_accessor :path

    def initialize(file)
        @path = file
    end
    def path
        @path
    end
end 