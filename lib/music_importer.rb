require 'pry'

class MusicImporter
    attr_accessor :path

    def initialize(file)
        @path = file
    end
    def path
        @path
    end
    def files
        files = Dir.glob("*.mp3", base:@path)
    end
    def import
        self.files.each do |f|
            Song.create_from_filename(f)
        end
    end
end 