require 'pry'

class Cat
    attr_accessor :mood, :owner
    attr_reader :name

    @@all = []

    def initialize(name, owner)
      @name = name 
      @owner = owner
      owner.add_cat(self) unless owner.cats.include?(self)
      @mood = "nervous"
      @@all << self
      
      
    end

    def self.all
      @@all
    end

    

  
    
end