require_relative('../models/artist.rb')
require_relative('../models/album.rb')

artist01 = Artist.new({'name'=>'Michael Jackson'})
artist02 = Artist.new({'name'=>'Weird Al Yankovic'})
artist03 = Artist.new({'name'=>'Bon Jovi'})
artist04 = Artist.new({'name'=>'Miyavi'})
artist05 = Artist.new({'name'=>'Nobuo Uematsu'})

#Artist.Delete_all
#Artist.save
p "create artists? yes.no"
answer = gets.chomp
if answer == "yes"
        artist01.save
        artist02.save
        artist03.save
        artist04.save
        artist05.save
        answer = ""
end

p "list all artists? yes/no"
answer = gets.chomp
if answer == "yes"
        artists = Artist.read_all
        for artist in artists
            p "id:#{artist.id}| Artist name: #{artist.name}"
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
#Artist.update_by_id

#artist.delete_by_id
