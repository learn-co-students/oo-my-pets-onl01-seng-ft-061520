require "pry"
class Owner
  attr_reader :name, :species 
  
  @@all = []
  
  def initialize(name)
    @@all << self
    @name = name
    #@name = name 
    @species = species 
   @allpets = {dogs: [], cats: []}
  end 
  
  def name
   # binding.pry 
    #reader name 
    @name
  end 

  # def species 
  #   @species
  # end 
  
  def species
    @species = "human"
  end 

  def say_species
   "I am a #{species}."
  end 
  
  def self.all 
    @@all 
  end 
  
  def self.count
    @@all.count
  end 
  
  def self.reset_all
    @@all.clear 
  end 
  
  def cats 
    Cat.all.select do |cat|
      cat.owner == self 
    end 
  end 
  
  def dogs 
    Dog.all.select do |dog|
      dog.owner == self 
    end 
  end 
  
  def buy_cat(cat)
   Cat.new(cat, self)
    
  end 
  
  def buy_dog(dog)
   Dog.new(dog, self)
  end 
  
  def feed_cats 
    Cat.all.each {|cat| cat.mood = "happy"}
  end 
  
  def walk_dogs
    Dog.all.each {|dog| dog.mood = "happy" }
  end 
  
  def sell_pets 
    Dog.all.each {|dog| dog.mood = "nervous"}
    Cat.all.each {|cat| cat.mood = "nervous"}
    Dog.all.each {|dog| dog.owner = nil}   
    Cat.all.each {|cat| cat.owner = nil}
  end 
  
  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)." 
  end 
  
end