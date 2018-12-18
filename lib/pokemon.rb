class Pokemon
  attr_accessor :id, :name, :type, :db
  @@all = []
  def initialize (id: nil, name: nil, type: nil, db: nil)
    @@all << self
  end
  def self.save (name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end
  def self.find (id, db)
    name_type = db.execute("SELECT name, type FROM pokemon WHERE id = #{id}").flatten
    name = name_type[0]
    type = name_type[1]
    Pokemon.new(id: id, name: name, type: type, db: db)
  end
end
