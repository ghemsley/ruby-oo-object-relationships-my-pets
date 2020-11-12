class Dog
  @@all = []
  attr_accessor :mood
  attr_reader :name, :owner
  def initialize(name, owner)
    @name = name
    @owner = owner
    @species = 'dog'
    @mood = 'nervous'
    @@all.push(self)
  end

  def owner=(owner)
    @owner = owner
    owner.dogs.push(self) unless self.owner.nil?
  end

  def self.all
    @@all
  end
end
