require 'pry'

class Owner
  attr_reader :species, :name
  attr_accessor :pets, :dog, :cat

  @@all = []

  def initialize(name)
    @species = "human"
    @name = name
    @pets = {:dogs => [], :cats => []}
    @@all << self
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end

  def say_species
    "I am a #{@species}."
  end

  def cats
    Cat.all.select do |cat|
    #  binding.pry
      cat.owner == self 
    end
  end

  def dogs
    Dog.all.select do |dog|
      dog.owner == self
    end
  end

  def buy_cat(name)
    @pets[:cats] << Cat.new(name, self)
  end

  def buy_dog(name)
    @pets[:dogs] << Dog.new(name, self)
  end

  def walk_dogs
    @pets[:dogs].each do |dog|
      dog.mood = 'happy'
    end
  end

  def feed_cats
    @pets[:cats].each do |cats|
      cats.mood = 'happy'
    end
  end

  def sell_pets
    @pets.each do |pet, arr|
      arr.map do |pet|
        pet.mood = 'nervous'
      end
    end
  end

  def list_pets
    "I have #{dogs.length} dog(s), and #{cats.length} cat(s)."
  end

end