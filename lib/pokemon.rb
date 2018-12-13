class Pokemon
attr_accessor :id, :name, :type, :db
  @@all = {}
def initialize(id)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(id, name, type)
   self.class.all << self
  end

  def find
  end

end
