require 'pry'


class Owner
  attr_accessor :cats, :dogs
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @cats = []
    @dogs = []
    @@all << self
  end

  def say_species 
    "I am a #{self.species}."
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
     @cats
  end

  def dogs
    @dogs
  end

  
        
  def add_cat(cat)
    @cats << cat 
    cat.owner = self unless cat.owner == self
  end

  
  
  def add_dog(dog)
    @dogs << dog 
    dog.owner = self unless dog.owner == self
  end

  def buy_cat(name)
      Cat.new(name, self)
  end

  def buy_dog(name)
      Dog.new(name, self)
  end

  def walk_dogs
    dogs.each {|dog| dog.mood = 'happy'}
  end

  def feed_cats
    cats.each {|cat| cat.mood = 'happy'}
  end

  def sell_pets
    dogs.each {|dog| dog.mood = 'nervous'}
    cats.each {|cat| cat.mood = 'nervous'}
    cats.each {|cat| cat.owner = nil}
    dogs.each {|dog| dog.owner = nil}
    @cats.clear
    @dogs.clear
  end

  def list_pets 
    "I have #{@dogs.length} dog(s), and #{cats.length} cat(s)."

    

  end



    
end