class Pokemon

  attr_accessor :id, :name, :type, :db

  # is initialized with keyword arguments of id, name, type and db
  def initialize(id:, name:, type:, db:)
  end

  # saves an instance of a pokemon with the correct id
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(db, id)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id=?")
    # new_pokemon = self.new(pokemon)
    # return new_pokemon
  end

end
