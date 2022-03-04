
class MusicLibraryController
    def initialize(path = "./db/mp3s")
        MusicImporter.new(path).import
    end 
    def call
        until @input == "exit" do
            puts "Welcome to your music library!"
            puts "To list all of your songs, enter 'list songs'."
            puts "To list all of the artists in your library, enter 'list artists'."
            puts "To list all of the genres in your library, enter 'list genres'."
            puts "To list all of the songs by a particular artist, enter 'list artist'."
            puts "To list all of the songs of a particular genre, enter 'list genre'."
            puts "To play a song, enter 'play song'."
            puts "To quit, type 'exit'."
            puts "What would you like to do?"
            @input = gets.chomp
            case @input
            when "list songs"
                list_songs
            when "list artists"
                list_artists
            when "list genres"
                list_genres
            when "list artist"
                list_songs_by_artist
            when "list genre"
                list_songs_by_genre
            when "play song"
                play_song
            end
        end
    end

    def list_songs
        a = Song.all.sort_by{|song| song.name}
        i = 1
        @songHash = {}
        a.each do |s|
            @songHash[i] = s 
            puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
            i +=1
        end
    end
    def list_artists
        a = Artist.all.sort_by{|artist| artist.name}
        i = 1
        artHash = {}
        a.each do |s|
            artHash[i] = s 
            puts "#{i}. #{s.name}"
            i += 1
        end
    end
    def list_genres
        a = Genre.all.sort_by{|artist| artist.name}
        i = 1
        genreHash = {}
        a.each do |s|
            genreHash[i] = s 
            puts "#{i}. #{s.name}"
            i += 1
        end
    end
    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        name = gets.chomp
        a = Song.all.select{|song| song.artist.name == name}.sort_by{|song|  song.name}
        i = 1
        songSmallHash = {}
        a.each do |s|
            songSmallHash[i] = s 
            puts "#{i}. #{s.name} - #{s.genre.name}"
            i +=1
        end
    end
    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        name = gets.chomp
        a = Song.all.select{|song| song.genre.name == name}.sort_by{|song|  song.name}
        i = 1
        songSmallHash2 = {}
        a.each do |s|
            songSmallHash2[i] = s 
            puts "#{i}. #{s.artist.name} - #{s.name}"
            i +=1
        end
    end
    def play_song
        puts "Which song number would you like to play?"
        selected = gets.strip.to_i
        a = Song.all.sort_by{|song| song.name}
        #binding.pry
        if selected >= 1 && selected <= a.length
            pick = a[selected-1]
            puts "Playing #{pick.name} by #{pick.artist.name}"
        end
    end
end 