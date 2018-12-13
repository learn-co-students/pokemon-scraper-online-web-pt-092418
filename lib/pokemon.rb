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
   results =  db.execute("SELECT name, type FROM pokemon WHERE id = ?", id)
   self.new(results)
  end

end
