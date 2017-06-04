# Defines a method to do the Tunnel room
def tunnel_room
  puts """
You tunnel through the snow for an hour.
You hit a hard surface and clear the snow off it.
It turns out to be a door made of ice.
What do you do? \n \n* open door \n* turn around
"""

  # Prints a prompt
  print "> "

  choice = $stdin.gets.chomp

  if choice == "open door"
    puts """
You enter a room with a snow monster
standing in front of a pre-dug tunnel.
What do you do? \n \n* run around \n* offer peppermint candy
           """
  print "> "
    # Assigns the variable "door" to the decision at the tunnel room.
    door = $stdin.gets.chomp
    if door == "run around"
        dead("The monster stomps its feet and \nthe snow collapses on you and you die.")
    elsif door == "offer peppermint candy"
        puts "The monster takes it and goes \nto the corner of the room to eat it. \nYou slowly creep into the tunnel."
        crystal_room
    else
      puts "I got no idea what that means."
    end
  elsif choice == "turn around"
    dead("You make it a few feet back down \nthe tunnel and the snow collapses \non you and you die.")
  else
    puts "I got no idea what that means."
  end
end

def journey_room
  puts """
You feel fatigued. Do you keep
walking or do you snack on some
of the fallen snow?
* keep walking
* snack on snow
  """
  print "> "

  moving = $stdin.gets.chomp
  if moving == "keep walking"
    puts """
You stumble onto a house with
an open door. You walk inside.
You light the lanterns and see
there is an old elevator in the
middle of the house. Do you take
it or leave?
* take elevator
* leave
"""
  print "> "
    decision = $stdin.gets.chomp
    if decision == "take elevator"
      crystal_room
    elsif decision == "leave"
      dead("You grow fatigued after leaving\nand collapse in the snow.\nYou freeze to death.")
    else
      puts "I got no idea what that means."
    end
  elsif moving == "snack on snow"
    dead("The snow you ate makes you feel\nweary. You pass out in the snow\nand later freeze to death.")
  else
    puts "I got no idea what that means."
  end
end

final_color = "red"

def crystal_room
   puts """
CRYSTAL ROOM ///////////

The room illuminates with
crystals of all colors. What
color crystal do you touch?

"""
  while true
    print "> "
    color = $stdin.gets.chomp
    if color == "red"
      puts "//////////////////////"
      puts "You feel a renewed sense of energy and warmth."
      final_color = color
      quantity
    elsif color == "orange"
      puts "//////////////////////"
      puts "A bunch of gold bars and jewels"
      puts "appear at your feet. You have all"
      puts "the fortune you've ever dreamed of."
      final_color = color
      quantity
    elsif color == "yellow"
      puts "//////////////////////"
      puts "You feel ill and collapse."
      final_color = color
      quantity
    elsif color == "green"
      puts "//////////////////////"
      puts "You suddenly discover you have supreme"
      puts "intellectual powers."
      final_color = color
      quantity
    elsif color == "blue"
      puts "//////////////////////"
      puts "You discover you have the power to fly."
      puts "You fly out of the crystal room and back"
      puts "into the nearest city. You become a celebrity."
      final_color = color
      quantity
    elsif color == "purple"
      puts "//////////////////////"
      puts "You are filled with maximum healing"
      puts "& happiness."
      final_color = color
      quantity
    else
      puts "//////////////////////"
      puts "That color is not here."
      puts "*\n*\n*\n*\n*\n*\n"
      puts "Choose again."
      puts "*\n*\n*\n*\n*\n*\n"
    end
  end
end

def quantity
  puts "//////////////////////"
  puts "How many crystals do you take with you?"

  print "> "

  begin
    choice = $stdin.gets.chomp
    how_many = Integer(choice)
  rescue
    print "Please enter a number: "
    retry
  end

  if how_many < 5 || how_many > 100
    puts "You win!!!!"
    exit(0)
  else
    dead ("You are too greedy!")
  end
end

def dead(why)
  puts why
  exit(0)
end

def start
  puts "You are caught in a blizzard."
  puts "Snow is building up all around you,"
  puts "what do you do?"
  puts "* make a snow tunnel"
  puts "* continue to walk"

  print "> "
  direction = $stdin.gets.chomp

  if direction == "make a snow tunnel"
    tunnel_room
  elsif direction == "continue to walk"
    journey_room
  else
    start
  end
end

BEGIN {puts "-----------------------------
  \nS N O W  G A M E
  \n S N O W  G A M E
  \n  S N O W  G A M E
  \n   S N O W  G A M E
  \nS N O W  G A M E
  \n S N O W  G A M E
  \n  S N O W  G A M E
  \n   S N O W  G A M E
  \n    S N O W  G A M E
  \n     S N O W  G A M E
  \n      S N O W  G A M E
  \n       S N O W  G A M E
  \n        S N O W  G A M E
  \n-----------------------------"}

END {puts "*    *   *     *         *
  * G   *     *    * *         *
  *   A   *    *    *  *  *  *
    *   M   *    *        *
   *      E  *  *      *  *  *
  *  *  *  *   *    *    *
  * *   *  *  * O           *
  *   *    *   *  V    *   *  * *
  *  *              E   *
  *   *    *     *    R *  * *
  *            *       *"              }

start
