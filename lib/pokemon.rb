class Pokemon
attr_accessor :id, :name, :type, :db
  @@all =[]
def initialize(id)
    @id = id
    @name = name
    @type = type
    @db = db
    @@all << self
  end

  def self.save(name, type, db)
      db.execute("INSERT INTO pokemon(name, type) VALUES(?,?)", name, type)
  end

  def self.find(id, db)
   all_results =  db.execute("SELECT id, name, type FROM pokemon WHERE id = ?", id)
   first_result = all_results[0]
   first_result_id = first_result[0]
   first_result_name = first_result[1]
   first_result_type = first_result[2]
   pokemon = self.new(first_result_id)
   pokemon.name = first_result_name
   pokemon.type = first_result_type
   pokemon
  end

end
