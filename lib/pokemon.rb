class Pokemon
    attr_accessor :name, :type, :db, :id
    
    def initialize (params = {name: name, type: type,  db: @db, id: id=nil})
        @id = params[:id]
            @name = params[:name]
            @type = params[:type]
            @db = params[:db]
    end

    
    def create_table
        sql = "CREATE TABLE pokemon (id INTEGER PRIMARY KEY, name TEXT, type TEXT)"    
        @db[:conn].execute(sql)
    end

    def self.save(name, type, db)
            sql = "INSERT INTO pokemon (name, type) VALUES(?, ?)"
            # @id = @db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
            db.execute(sql, name, type)
    end

    def self.find(id, db)
       sql = "SELECT * FROM pokemon WHERE id = ? "
       abc = db.execute(sql,id)[0]
       puts abc.class
        ab = Pokemon.new({name: abc[1], type: abc[2], db: db, id: abc[0]})
    end
 end