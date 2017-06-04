## Animal is-a object look at the extra credit
class Animal
end

# Make a class Dog that is-a Animal
class Dog < Animal

  def initialize(name)
    #Create an attribute @name and set it to the local variable, name
    @name = name
  end
end

# Make a class Cat that is-a Animal
class Cat < Animal

  def initialize(name)
    # Create an attribute @name and set it to the local variable, name
    @name = name
  end
end

# Make a new class and call it Person
class Person

  def initialize(name)
    # Person has-a name of some kind
    @name = name

    ## Person has-a pet of some kind
    @pet = nil
  end

  attr_accessor :pet
end

# Make a class called Employee that is-a Person
class Employee < Person

  def initialize(name, salary)
    # From the parent class, get and run the function of the same name
    super(name)
    # Employee has-a salary of some kind
    @salary = salary
  end

  def promotion
    puts "Your old job salary was #{@salary}."
    @salary *= 2
    puts "Your new job salary is #{@salary}."
  end

end

class Musician < Person
attr_accessor :instrument, :songs
  def initialize(instrument, songs)
    @instrument = instrument
    @songs = songs
  end

  def see_all
    puts "I play #{@instrument}."
    puts "I know these songs: #{@songs}."
  end

end

# Make a class called Fish
class Fish
end

# Create a a class called Salmon that is-a Fish
class Salmon < Fish
end

# Create a class called Halibut that is-a Fish
class Halibut < Fish
end


## rover is-a Dog
rover = Dog.new("Rover")

# Set satan to a new instance of class Cat and call it with the "Satan" parameter
satan = Cat.new("Satan")

# Set Mary to a new instance of class Person and call it with the "Mary" parameter
mary = Person.new("Mary")

# From Mary, get the pet attribute and set it to satan
mary.pet = satan

# Set frank to a new instance of class Employee and call it with the "Frank" and 120000 parameters
frank = Employee.new("Frank", 120000)

# From frank, get the pet attribute and set it to rover
frank.pet = rover

# Set flipper to a new instance of the class Fish
flipper = Fish.new()

# Set crouse to a new instance of the class Salmon
crouse = Salmon.new()

# Set harry to a new instance of the class Halibut
harry = Halibut.new()

brett = Musician.new("vibes", ["Maputo"])
brett.instrument = "guitar"

brett.see_all
