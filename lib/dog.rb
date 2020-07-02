class Dog
  attr_accessor :owner, :mood
    attr_reader :name

    @@all_dogs = []
    def initialize(dog_name, owner_name)
      @name = dog_name
      @owner = owner_name
      @mood = "nervous"
      @@all_dogs << self
    end

    def self.all
      @@all_dogs
    end
  end

# class Dog
#   # code goes here
#   attr_accessor :mood, :owner
#   attr_reader :name
#   @@all = []
#   def initialize(name, owner)
#     @name = name
#     @owner = owner
#     @mood = "nervous"
#     save
#   end
#   def save
#     @@all << self
#   end

#   def self.all
#     @@all
#   end

# end