class Dog
  attr_accessor :owner, :mood
  attr_reader :name

  @@all = []

  def initialize(name, owner)
    @name = name 
    @owner = owner 
    owner.add_dog(self) unless owner.dogs.include?(self)
    @mood = "nervous"
    @@all << self
  end
  
  def self.all
    @@all
  end

end