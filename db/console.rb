require_relative('../models/artist.rb')
require_relative('../models/album.rb')





answer = ""
while answer != "exit"
        p "delete all table entries? yes/no"
        answer = gets.chomp
        if answer == "yes"
                Album.delete_all
                Artist.delete_all
                p "cleared all artists"
                answer = ""
        end

        p "populate artists&albums? yes.no"
        answer = gets.chomp
        if answer == "yes"
                artist01 = Artist.new({'name'=>'Michael Jackson'})
                artist02 = Artist.new({'name'=>'Weird Al Yankovic'})
                artist03 = Artist.new({'name'=>'Bon Jovi'})
                artist04 = Artist.new({'name'=>'Miyavi'})
                artist05 = Artist.new({'name'=>'Nobuo Uematsu'})
                artist01.save
                artist02.save
                artist03.save
                artist04.save
                artist05.save
                album01 = Album.new({   'title'=>'Dangerous',
                                        'genre'=>'Rock n Pop',
                                        'artist_id'=> artist01.id})
                album02 = Album.new({   'title'=>'Thriller',
                                        'genre'=>'Rock n Pop',
                                        'artist_id'=> artist01.id})
                album03 = Album.new({   'title'=>'Mandatory Fun',
                                        'genre'=>'Parody',
                                        'artist_id'=> artist02.id})
                album04 = Album.new({   'title'=>'Running With Scissors',
                                        'genre'=> 'Parody',
                                        'artist_id'=> artist02.id})
                album05 = Album.new({   'title'=>'Slippery When Wet',
                                        'genre'=> 'Rock',
                                        'artist_id'=> artist03.id})
                album06 = Album.new({   'title'=>'Keep The Faith',
                                        'genre'=> 'Rock',
                                        'artist_id'=> artist03.id})
                album07 = Album.new({   'title'=>'Firebird',
                                        'genre'=>'J Rock',
                                        'artist_id'=> artist04.id})
                album08 = Album.new({   'title'=>'Miyavism',
                                        'genre'=>'J Rock',
                                        'artist_id'=> artist04.id})
                album09 = Album.new({   'title'=>'Music of Final Fantasy III',
                                        'genre'=>'Game',
                                        'artist_id'=>artist05.id})
                album10 = Album.new({   'title'=>'Final Fantasy VI Soundtrack',
                                        'genre'=>'game',
                                        'artist_id'=> artist05.id})
                album01.save
                album02.save
                album03.save
                album04.save
                album05.save
                album06.save
                album07.save
                album08.save
                album09.save
                album10.save
                answer = ""
        end

        p "list all artists? yes/no"
        answer = gets.chomp
        if answer == "yes"
                artists = Artist.read_all
                if artists != nil
                        for artist in artists
                            p "id:#{artist.id}| Artist name: #{artist.name}"
                        end
                else
                p "there are currently no arists in this table"
                end
        end
        p "list all albums? yes/no"
        answer = gets.chomp
        if answer == "yes"
                albums = Album.read_all
                if albums != nil
                        for album in albums
                            p "id:#{album.id}| Album title:#{album.title}| genre:#{album.genre}|artist_id:#{album.artist_id}"
                        end
                else
                p "there are currently no albums in this table"
                end
        end

        p "look for artist by id? yes/no"
        answer = gets.chomp
        if answer == "yes"
                p "searching for artist by id, please enter id#"
                answer = gets.chomp
                summary = Artist.read_by_id(answer)
                if summary != nil
                        p "id:#{summary.id}| Artist: #{summary.name}"
                        answer = ""
                else
                        p "Error:id##{answer} doesn't exist"
                        answer = ""
                end
        end

        p "update artist by id? yes/no"
        answer = gets.chomp
        if answer == "yes"
                p "enter artist id you wish to edit:"
                artist_id = gets.chomp
                p "enter artists new name"
                artist_name = gets.chomp
                edit_artist = {'id' => artist_id, 'name' => artist_name}
                Artist.update_by_id(edit_artist)
                p "artist updated"
        end

        p "delete an artist?"
        answer = gets.chomp
        if answer == "yes"
                p "enter artist id you wish to delete"
                answer = gets.chomp
                Artist.delete_by_id(answer)
                p "artist has been removed"
        end


        p "type 'exit' to quit, or hit return to repeat"
        answer = gets.chomp
end
