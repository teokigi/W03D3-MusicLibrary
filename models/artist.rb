require_relative('../db/sql_runner.rb')

class Artist

    attr_accessor :name
    attr_reader :id

    def initialize(options)
        @name = options['name']
        @id = options['id'].to_i if options['id']
    end

    def save
        sql = "INSERT INTO artists (name) VALUES ($1) RETURNING id"
        values = [@name]
        @id = SqlRunner.run(sql,values)[0]['id'].to_i
    end

    def self.read_all
        sql = "SELECT * FROM artists"
        summary_hash = SqlRunner.run(sql,[])
        return summary_hash.map{|artist|Artist.new(artist)}
    end

    def read_by_id(id)
        sql = "SELECT * FROM artist WHERE id = $1"
        values = [id]
        summary_hash = SqlRunner.run(sql,values)
        return Artist.new(summary_hash)
    end
end
