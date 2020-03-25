require_relative('../db/sql_runner.rb')

class Album

    attr_accessor :title, :genre, :artist_id
    attr_reader :id

    def initialize(options)
        @title = options['title']
        @genre = options['genre']
        @artist_id = options['artist_id']
        @id = options['id'].to_i if options['id']

    end

    def save
        sql = "INSERT INTO albums (title,genre,artist_id)
            VALUES ($1,$2,$3) RETURNING *"
        values = [@title,@genre,@artist_id]
        @id = SqlRunner.run(sql,values)[0]['id'].to_i
    end

end
