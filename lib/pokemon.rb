class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  # is initialized with keyword arguments of id, name, type and db
  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  # saves an instance of a pokemon with the correct id
  def self.save(name, type, database)
    database.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, database)
    pokemon = database.execute("SELECT * FROM pokemon WHERE id=?", id).flatten
    new_pokemon = self.new(id: pokemon[0], name: pokemon[1], type: pokemon[2],
      db: database, hp: pokemon[3])
  end

  def alter_hp(number, database)

    sql = "UPDATE pokemon SET hp = ? WHERE id = ?"

    database.execute(sql, number, self.id)
  end

end
