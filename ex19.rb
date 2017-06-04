# Defines a method called "Cheese and Crackers"
def cheese_and_crackers(cheese_count, boxes_of_crackers)
  puts "You have #{cheese_count} cheeses!"
  puts "You have #{boxes_of_crackers} boxes of crackers!"
  puts "Man that's enough for a party!"
  puts "Get a blanket.\n"
end

# Shows we can pass numbers into our function/method
# and it prints out the method with the new values
puts "We can just give the function numbers directly:"
cheese_and_crackers(20, 30)


# Shows that we can assign values to the variables
# in our functions
puts "OR, we can use variables from our script:"
amount_of_cheese = 10
amount_of_crackers = 50

# Runs the function with variables and its assigned values
cheese_and_crackers(amount_of_cheese, amount_of_crackers)


# Shows that we can do math inside the arguments for the
# function
puts "We can even do math inside too:"
cheese_and_crackers(10 + 20, 5 + 6)


# Shows that you can combine variables, numbers and math
puts "And we can combine the two, variables and math:"
cheese_and_crackers(amount_of_cheese + 100, amount_of_crackers + 1000)
