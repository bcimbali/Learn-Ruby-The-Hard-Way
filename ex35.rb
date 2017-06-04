# defines a method called "gold room"
def gold_room
  # prints a line to tell you about the room
  puts "This room is full of gold. How much do you take?"

  # prints  a prompt
  print "> "
  # gets the string input from the user and store it in the variable, "choice"
  begin
    choice = $stdin.gets.chomp
    how_much = Integer(choice)
  rescue
    print "Please enter a number: "
    retry
  end

# asks if your integer "how_much" is less than 50
  if how_much < 50
    # prints the following string
    puts "Nice, you're not greedy, you win!"
    # Initiates termination by raising the SystemExit exception.
    exit(0)
    # otherwise, do this
  else
    # calls the dead method and passes the string in as an argument
    dead("You greedy bastard!")
    # ends the if statement
  end
  # ends the script
end

# defines a method called "bear_room"
def bear_room
  # Prints text for start of bear room sequence
  puts "There is a bear here."
  puts "The bear has a bunch of honey."
  puts "The fat bear is in front of another door."
  puts "How are you going to move the bear?:"
  puts "* take honey"
  puts "* taunt bear"
  # makes a variable called bear_moved and sets it to false
  bear_moved = false

  # creates a while loop and sets it to true-thereby making an infinite loop
  while true
    # prints a prompt arrow
    print "> "
    # makes a variable called "choice" and sets it to a string input from the user
    choice = $stdin.gets.chomp

# creates an if branch depending on what is entered as a string in the choice variable
# if "take honey" is passed as a string, do this:
    if choice == "take honey"
      # calls the "dead" method and passes in the string in the argument
      dead("The bear looks at you then slaps your face off.")
      # runs this if you enter "taunt bear" and "bear_moved" is false
    elsif choice == "taunt bear" && !bear_moved
      # prints the string below
      puts "The bear has moved from the door. You can go through it now."
      # sets the boolean "bear_moved" to true
      bear_moved = true
      # runs this if "taunt bear" is typed and bear_moved is true
    elsif choice == "taunt bear" && bear_moved
      # runs the method "dead" and passes in this argument
      dead("The bear gets pissed off and chews your leg off.")
      # Runs this if "open door" is passed as a string and "bear_moved" is true
    elsif choice == "open door" && bear_moved
      # breaks out into the gold_room method
      gold_room
      # otherwise, do this:
    else
      # prints out the following string:
      puts "I got no idea what that means."
      # ends the if statement
    end
    # ends the while loop
  end
# ends the bear_room method
end

# define a method called "Cthulhu room"
def cthulhu_room
  # prints out these strings:
  puts "Here you see the great evil Cthulhu."
  puts "He, it, whatever stares at you and you go insane."
  puts "Do you flee for your life or eat your head?:"
  puts "* flee"
  puts "* eat your head"

# Prints a prompt arrow:
  print "> "
  # makes a variable called "choice" and allows you to input a string
  choice = $stdin.gets.chomp

# creates an if branch
# if the user enters in "flee" as a string, do this:
  if choice == "flee"
    # runs the start method
    start
    # otherwise, if the string includes the "head" string
  elsif choice == "eat your head"
    # run the dea method and pass in the string in the argument
    dead("Well that was tasty!")
    # otherwise, do this:
  else
    # run the cthulhu_room method
    cthulhu_room
    # ends the if statement
  end
# ends the cthulhu_room method
end

# defines the dead method.
# allows an argument to be passed into "dead" called the variable "why"
def dead(why)
  # prints the string variable "why" and then comma, "Good job!"
  puts why, "Good job!"
  # Initiates termination by running the SystemExit exception with no error code, "0"
  exit(0)
# ends the "dead" method
end

# defines a method called "start"
def start
  # prints out these stringz:
  puts "You are in a dark room."
  puts "There is a door to your right and left."
  puts "Which one do you take?"
  puts "* right"
  puts "* left"

# prints an arrow for a prompt
  print "> "
  # creates a variable called "choice" and allows the user to input a string for it
  choice = $stdin.gets.chomp

# creats an if statement
# if the variable "choice" is equal to left...
  if choice == "left"
    # run the "bear_room" method
    bear_room
  #otherwise, if the "choice" variable is right...
  elsif choice == "right"
    # run the "cthulhu_room" method
    cthulhu_room
    # otherwise, do this...
  else
    # run the "dead" method and pass in this string as an argument:
    dead("You stumble around the room until you starve.")
  # ends the if statement
  end
# ends the start method
end

# calls the start method.
start
