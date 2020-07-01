class Owner
  # code goes here
  attr_reader :name, :species
  @@all = []

  def initialize(name, species = 'human')
    @name = name
    @species = species
    save
  end
  
  def cats
    Cat.all.select { |cat| cat.owner == self }
  end

  def dogs
    Dog.all.select { |dog| dog.owner == self }
  end

  def save
    @@all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all = []
  end

  def buy_cat(cat_name)
    Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    Dog.new(dog_name, self)
  end

  def walk_dogs
    Dog.all.each do |dog|
      if dog.owner == self
        dog.mood = 'happy'
      end
    end
  end

  def feed_cats
    Cat.all.each do |cat|
      if cat.owner == self
        cat.mood = 'happy'
      end
    end
  end

  def sell_pets
    Cat.all.each do |cat|
      if cat.owner == self
        cat.mood = 'nervous'
        cat.owner = nil
      end
    end
    Dog.all.each do |dog|
      if dog.owner == self
        dog.mood = 'nervous'
        dog.owner = nil
      end
    end
  end

  def list_pets
    cat_counter = 0
    dog_counter = 0
    Cat.all.each do |cat|
      if cat.owner == self
        cat_counter += 1
      end
    end
    Dog.all.each do |dog|
      if dog.owner == self
        dog_counter += 1
      end
    end
    "I have #{dog_counter} dog(s), and #{cat_counter} cat(s)."
  end
end