
# A method that does a while loop for a variable entered.
def looper(i, value, add)
  numbers = []

  while i < value
    puts "At the top i is #{i}"
    numbers.push(i)

    numbers.each {|i| puts "numbers: #{numbers}"}
    i += add
    puts "At the bottom i is #{i}"
  end
end

puts "The numbers: "

looper(0,10,2)
