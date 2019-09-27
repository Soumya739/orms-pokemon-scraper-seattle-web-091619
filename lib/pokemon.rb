require "pry"
class Pokemon
    attr_accessor :name, :type, :db, :id
    
    def initialize (poke = {name: name, type: type,  db: db, id: id=nil})
        @id = poke[:id]
        @name = poke[:name]
        @type = poke[:type]
        @db = poke[:db]
    end

    def self.save(name, type, db)
        sql = "INSERT INTO pokemon (name, type) VALUES(?, ?)"
        # @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
        db.execute(sql, name, type)
    end

    def self.find(id, db)
       sql = "SELECT * FROM pokemon WHERE id = ? "
       abc = db.execute(sql,id)[0]
       puts abc.class
       Pokemon.new({id: abc[0], name: abc[1], type: abc[2], db: db})
    end
 end