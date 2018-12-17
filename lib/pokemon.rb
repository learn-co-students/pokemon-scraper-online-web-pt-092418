class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, hp: nil )
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, database)
      database.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end

  def self.find(id, database)
   data = database.execute("SELECT * FROM pokemon WHERE id = (?)", id).flatten
    self.new(id:data[0], name:data[1], type:data[2], db:database, hp:data[3])
  end

  def alter_hp(hp, database)
    database.execute("UPDATE pokemon SET hp = (?) WHERE id = (?)", hp, self.id)
  end

end

#flatter is to remove nested arrays
# uniq