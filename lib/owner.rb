class Owner
  @@all = []
  counter = 0
  attr_reader :name, :species
  def initialize(name)
    @name = name
    @species = "human"
    save
  end

  def say_species
    "I am a #{species}."
  end

  def save
    @@all << self
  end
 
  def self.all
    @@all
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    self.all.clear
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(name)
    Cat.new(name, self)

  end

  def buy_dog(name)
    Dog.new(name, self)

  end

  def walk_dogs
    self.dogs.each {|dog| dog.mood = "happy" }

  end

  def feed_cats
    self.cats.each {|cat| cat.mood = "happy" }

  end

  def pets
    cats == dogs

  end


  def sell_pets
  pets = self.dogs + self.cats
  
  pets.each do |pet|
    pet.mood = "nervous"
    pet.owner = nil
  end
end

def list_pets
  "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
end


  # code goes here
end