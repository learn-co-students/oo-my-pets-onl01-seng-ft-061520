class Cat
  attr_accessor :owner, :mood
  attr_reader :name

      @@all_cats = []
    def initialize(cat_name, owner_name)
      @name = cat_name

      @owner = owner_name

      @mood = "nervous"
      @@all_cats << self
    end

    def self.all
      @@all_cats
    end
  end