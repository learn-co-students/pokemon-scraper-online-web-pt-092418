require 'pry'
class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  @@all = []

  def initialize (pokemon)
    @id = pokemon[:id]
    @name = pokemon[:name]
    @type = pokemon[:type]
    @db = pokemon[:db]
    @hp = 60
    @@all << self
    pokemon
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    name = db.execute("SELECT name FROM pokemon WHERE id = #{id}").flatten[0]
    type = db.execute("SELECT type FROM pokemon WHERE id = #{id}").flatten[0]
    pokemonhash = {id: id, name: name, type: type, db: db}
    newPokemon = Pokemon.new(pokemonhash)
  end
end
