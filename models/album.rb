require_relative('../db/sql_runner.rb')

class Album

    attr_accessor :title, :genre, :artist_id
    attr_reader :id

    def initialize(options)
        @title = options['title']
        @genre = options['genre']
        @artist_id = options['artist_id'].to_i
        @id = options['id'].to_i if options['id']

    end

    def self.delete_all
        sql = "DELETE FROM albums"
        SqlRunner.run(sql,[])
    end
    def save
        sql = "INSERT INTO albums (title,genre,artist_id)
            VALUES ($1,$2,$3) RETURNING *"
        values = [@title,@genre,@artist_id]
        @id = SqlRunner.run(sql,values)[0]['id'].to_i
    end

    def self.read_all
        sql = "SELECT * FROM albums"
        summary_hash = SqlRunner.run(sql,[])
        return nil if summary_hash.first() == nil
        return summary_hash.map{|album|Album.new(album)}
    end

    def self.read_by_id(id)
        sql = "SELECT * FROM albums WHERE id = $1"
        values = [id]
        summary_hash = SqlRunner.run(sql,values).first()
        return nil if summary_hash == nil
        return Album.new(summary_hash)
    end

    def self.read_by_artist_id(id)
        sql = "SELECT * FROM albums WHERE artist_id = $1"
        values = [id]
        summary_hash = SqlRunner.run(sql,values)
        return nil if summary_hash.first() == nil
        return summary_hash.map{|album|Album.new(album)}
    end

    def self.update_by_id(album)
        sql = "UPDATE albums SET (title,genre,artist_id) = ($1,$2,$3)
                WHERE id = $4"
        values = [  album['title'],
                    album['genre'],
                    album['artist_id'],
                    album['id']
                 ]
        SqlRunner.run(sql,values)
    end

    def self.delete_by_id(id)
        sql = "DELETE FROM albums WHERE id = $1"
        values = [id]
        SqlRunner.run(sql,values)
    end
end
