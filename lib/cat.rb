class Cat
  attr_accessor
  attr_writer 
  attr_reader :name, :owner, :mood
  
  @@all = []
  
  def initialize(name, owner)
    @name = name
    @owner = owner
    @mood = "nervous"
    @@all << self
  end
  
  def owner=(new_owner)
    @owner = new_owner
  end
  
  def mood=(mood)
    @mood = mood
  end
  
  def self.all
    @@all
  end
end