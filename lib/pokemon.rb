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
    name = db.execute("SELECT name FROM pokemon WHERE id = #{id}").flatten[0]
    type = db.execute("SELECT type FROM pokemon WHERE id = #{id}").flatten[0]
    Pokemon.new(id: id, name: name, type: type, db: db)
  end
end
