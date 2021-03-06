require 'pry'
class Owner
  # code goes here
  attr_reader :species
  attr_accessor :name, :pets

  @@all = []


  def initialize(species)
    @species = species
    @@all << self
    @pets = {:fishes => [], :dogs => [], :cats => []}
  end

  def self.reset_all
    @@all.clear
  end

  def self.all
    @@all
  end

  def self.count
    @@all.size
  end

  def say_species
    "I am a #{self.species}."
  end

  def buy_fish(name)
    @pets[:fishes] << Fish.new(name)
  end

  def buy_cat(name)
    @pets[:cats] << Cat.new(name)
  end

  def buy_dog(name)
    @pets[:dogs] << Dog.new(name)
  end

  def walk_dogs
    @pets[:dogs].map! do |dog|
      dog.mood = "happy"
    end
  end

  def play_with_cats
    @pets[:cats].map! do |cats|
      cats.mood = "happy"
    end
  end

  def feed_fish
    @pets[:fishes].map! do |fish|
      fish.mood = "happy"
    end
  end

  def sell_pets
    @pets.values.flatten.map! do |pet|
      pet.mood = "nervous"
    end
    @pets = {:fishes => [], :dogs => [], :cats => []}
  end

  def list_pets
    fishes = @pets[:fishes].count
    cats = @pets[:cats].count
    dogs = @pets[:dogs].count
    "I have #{fishes} fish, #{dogs} dog(s), and #{cats} cat(s)."
  end
end
