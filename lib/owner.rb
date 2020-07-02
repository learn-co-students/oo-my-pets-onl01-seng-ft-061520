require "pry"

class Owner
  attr_accessor 
  attr_writer 
  attr_reader :name, :species
  
  @@all = []
  
  def initialize(name,species=nil)
    @name = name
    species = self.species
    @@all << self
  end
  
  def species
    @species = "human"
  end
    
  def say_species
    return "I am a #{@species}."
  end
  
  def self.all
    @@all
  end
  
  def self.count
    self.all.length
  end
  
  def self.reset_all
    self.all.clear
  end
  
#Associations
  def cats
    Cat.all.select {|cat| cat.owner == self}
  end
  
  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end
  
  def buy_cat(name)
    name = Cat.new(name, self)
  end
  
  def buy_dog(name)
    name = Dog.new(name, self)
  end
  
  def walk_dogs
    self.dogs.each {|dog| dog.mood = "happy"}
  end
  
  def feed_cats
    self.cats.each {|cat| cat.mood = "happy"}
  end
  
  def sell_pets
    self.dogs.each {|dog| 
      dog.mood = "nervous"
      dog.owner = nil
    }
    self.cats.each {|cat| 
      cat.mood = "nervous"
      cat.owner = nil
    }
  end
  
  def list_pets
    return "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end