require_relative('../models/artist.rb')
require_relative('../models/album.rb')

artist01 = Artist.new({'name'=>'Michael Jackson'})
artist02 = Artist.new({'name'=>'Weird Al Yankovic'})
artist03 = Artist.new({'name'=>'Bon Jovi'})
artist04 = Artist.new({'name'=>'Miyavi'})
artist05 = Artist.new({'name'=>'Nobuo Uematsu'})

#Artist.Delete_all
#Artist.save
artist01.save
artist02.save
artist03.save
artist04.save
artist05.save
#artist.read_all

#artist.read_by_id

#Artist.update_by_id

#artist.delete_by_id
