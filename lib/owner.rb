
class Owner
  attr_accessor
  attr_reader :name, :species

  @@all = [ ]
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    say = "I am a #{@species}."
    say
  end

  def self.all
    @@all
  end

  def self.count
    @@all.size
  end

  def self.reset_all
    @@all.clear
  end

  def cats
  all_cats = []
  Cat.all.each do |i|
    if i.owner == self
      all_cats << i
    end
  end
  all_cats
end

  def dogs
    all_dogs = []
    # binding.pry
    Dog.all.each do |i|
      if i.owner == self
        all_dogs << i
      end
    end
    all_dogs
  end

  def buy_cat(cat_name)
    owner_name = self
    bought_cat = Cat.new(cat_name, owner_name)
  end

  def buy_dog(dog_name)
    owner_name = self
    bought_dog = Dog.new(dog_name, owner_name)
  end

  def walk_dogs
    dogs.each { |i| i.mood = "happy"}
  end

  def feed_cats
    cats.each { |i| i.mood = "happy" }
  end

  def sell_pets
    pets = self.dogs + self.cats

    pets.each do |i|
      i.mood = "nervous"
      i.owner = nil
    end
  end

  def list_pets
    list = "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
    list
  end
end


