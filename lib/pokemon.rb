class Pokemon
  attr_accessor :id, :name, :type, :db
  
  @@all = []
  
  def initialize(id: nil, name: nil, type: nil, db: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    
    @@all.push(self)
  end
  
  def self.all
    @@all
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end
  
  def self.find (id, db)
    name_type = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    pname = name_type[1]
    ptype = name_type[2]
    Pokemon.new(id: id, name: pname, type: ptype, db: db)
  end
end
