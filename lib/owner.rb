class Owner
  @@all = []
  attr_reader :name, :species
  def initialize(name)
    @name = name
    @species = 'human'
    @cats = [] || Cat.all.select do |cat|
      cat.owner == self if cat.owner
    end
    @dogs = [] || Dog.all.select do |dog|
      dog.owner == self if dog.owner
    end
    @@all.push(self)
  end

  def cats
    @cats = Cat.all.select do |cat|
      cat.owner == self if cat.owner
    end
    @cats
  end

  def dogs
    @dogs = Dog.all.select do |dog|
      dog.owner == self if dog.owner
    end
    @dogs
  end

  def say_species
    p "I am a #{species}."
  end

  def buy_cat(name)
    new_cat = Cat.new(name, self)
    cats.push(new_cat)
  end

  def buy_dog(name)
    new_dog = Dog.new(name, self)
    dogs.push(new_dog)
  end

  def feed_cats
    Cat.all.each do |cat|
      cat.mood = 'happy' if cat.owner == self
    end
  end

  def walk_dogs
    Dog.all.each do |dog|
      dog.mood = 'happy' if dog.owner == self
    end
  end

  def list_pets
    p "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end

  def sell_pets
    Cat.all.each do |cat|
      next unless cat.owner == self

      cat.mood = 'nervous'
      cat.owner = nil
      cats.delete(cat)
    end
    cats.clear
    Dog.all.each do |dog|
      next unless dog.owner == self

      dog.mood = 'nervous'
      dog.owner = nil
      dogs.delete(dog)
    end
  end

  def self.all
    @@all
  end

  def self.count
    all.length
  end

  def self.reset_all
    all.clear
  end
end
