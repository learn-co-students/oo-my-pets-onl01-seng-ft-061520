class Owner
  # code goes here
  attr_reader :name, :species
  @@all = []
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end
  def self.all 
    @@all
  end
  def say_species
    "I am a #{@species}." 
  end 
  def self.count
    @@all.count
  end
  #change
  def self.reset_all
    @@all = []
  end
  def cats 
    Cat.all.select {|cat| cat.owner == self}
  end
  def dogs 
    Dog.all.select {|dog| dog.owner == self}
  end
  def buy_cat(name)
    Cat.new(name, self)
    #Cat.all.each do |cat|
     # if cat.name == name
      #  cat.owner = self
      #end
    #end
  end
  def buy_dog(name)
    Dog.new(name, self)
    #Dog.all.each do |dog|
     # if dog.name == name
      #  dog.owner = self
      #end
    #end
  end
  def walk_dogs
    Dog.all.each {|dog| dog.mood = "happy"}
  end
  def feed_cats
    Cat.all.each {|cat| cat.mood = "happy"}
  end
  def sell_pets
    Dog.all.each {|dog| dog.mood = "nervous"}
    Cat.all.each {|cat| cat.mood = "nervous"}
    Dog.all.each {|dog| dog.owner = nil}
    Cat.all.each {|cat| cat.owner = nil}
  end
  def list_pets
    dog_count = Dog.all.select {|dog| dog.owner == self}.count
    cat_count = Cat.all.select {|cat| cat.owner == self}.count
    "I have #{dog_count} dog(s), and #{cat_count} cat(s)."
  end
end