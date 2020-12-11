class Owner
  attr_reader :species, :name
  attr_accessor :pets, :dog, :cat

  @@all = []
  @@pets = {:dogs => [], :cats => []}

  def initialize(name)
    @species = "human"
    @name = name
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
    @@pets[:cats]
  end
end