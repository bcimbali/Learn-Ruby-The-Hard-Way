require './antarctica_engine'
require './player_module'

class Room
  include PlayerModule

  @@brett = Player.new

end

class Outside < Room
  def enter
    guard3 = Guard.new
    guard4 = Guard.new
    puts "\n\n"
    puts "* " * 30
    puts "After being transported by helicopter to the snowy Alaskan wilderness,"
    puts "you quietly trek your way to the edge of the enemies' base."
    puts "It's night and you use your thermal binoculors to scan the area."
    puts "There's only a few guards patrolling the outside of the base"
    puts "and there's a few security cameras scanning the perimeter."
    puts "\n\n"
    puts "You need to find a way in."
    puts "\n"
    puts "There's 3 possible ways you could take in:\n"
    puts "1-> enter thru the loading dock"
    puts "2-> enter thru the air conditioning ducts"
    puts "3-> enter thru the back door"
    puts "\nType in the number for the action you choose:"
    action = $stdin.gets.chomp

    if action == "1"
      puts "You sneak into the loading dock and crouch by a parked truck."
      puts "After waiting for one minute, you start to enter through the dock entrance."
      puts "A guard sees you and you battle with him."
      puts "Your health: #{@@brett.health}."
      puts "Guard's health: #{guard3.guard_health}."

      while @@brett.health > 0 && guard3.guard_health > 0
        battle = $stdin.gets.chomp
        if battle == "punch"
          puts "#{guard3.punch} #{@@brett.attack}"
        elsif battle == "kick"
          puts "#{guard3.kick} #{@@brett.attack}"
        elsif battle == "rest"
          puts "#{@@brett.rest} #{guard3.rest}"
        elsif @@brett.health == 0
          return 'death'
        else
          puts "I didn't understand, try again."
        end
      end
      puts "NICE JOB."
    elsif action == "2"
      puts "You quietly pop off the grate on the outside of the air conditioning"
      puts "ducts. You army crawl thru the ducts for about 25 minutes and finally reach"
      puts "anoter grate that you can see an empty storage room."
      puts "After scanning the room, you decide to pop off this grate and climb down."
    elsif action == "3"
      puts "You try to open the door as queitly as you can."
      puts "As soon as you open the door, you are met with a roomful of guards."
      puts "They immediately shoot at you."
      puts "Your health: #{@@brett.health}."
      puts "Guard's health: #{guard4.guard_health}."

      while @@brett.health > 0 && guard4.guard_health > 0
        battle = $stdin.gets.chomp
        if battle == "punch"
          puts "#{guard4.punch} #{@@brett.attack}"
        elsif battle == "kick"
          puts "#{guard4.kick} #{@@brett.attack}"
        elsif battle == "rest"
          puts "#{@@brett.rest} #{guard4.rest}"
        elsif @@brett.health == 0
          return 'death'
        else
          puts "I didn't understand, try again."
        end
      end
      puts "NICE JOB."
    else
      puts "Enter a number 1 through 3."
      return 'outside'
    end

    return 'storage_room'
  end
end

class StorageRoom < Room
  def enter
    guard2 = Guard.new
    puts "\n\n"
    puts "* " * 30
    puts "\n\n"
    puts "You take off the gate and quietly propel yourself down."
    puts "You climb behind some storage boxes and wait there for a few minutes."
    puts "You peer around the corner to get the layout of the room"
    puts "and notice 3 different routes to take, which one do you take?\n"
    puts "\n"
    puts "1-> Enter the pantry door."
    puts "2-> Enter the armory door."
    puts "3-> Sneak down the main corridor."
    puts "\nType in the number for the action you choose."
    action = $stdin.gets.chomp

    if action == "1"
      puts "You enter the pantry door and the room is empty."
      puts "No guards are in there so you decide to snack on a can of"
      puts "tuna fish. But, on your way taking the can down, you accidentally"
      puts "knock over a stack of rations. A bunch of guards storm in and shoot at you."
      return 'death'
    elsif action == "2"
      puts "\n\n"
      puts "* " * 30
      puts "You enter the armory and see a line of tanks and stockpiled ammunition."
      puts "Two guards are repairing a jeep in the back of the room."
      puts "Do you explore the rest of the room or leave the room?\n"
      puts "1-> Explore the room."
      puts "2-> Leave the room."
      action2 = $stdin.gets.chomp

      if action2 == "1"
        puts "You try to quietly sneak around the room.  Accidentally you knock"
        puts "over a box of bolts and the guards are alerted. They search for you and"
        puts "find you crouched behind a tank.  You do battle:"
        puts "Your health: #{@@brett.health}."
        puts "Guard's health: #{guard2.guard_health}."

        while @@brett.health > 0 && guard2.guard_health > 0
          battle = $stdin.gets.chomp
          if battle == "punch"
            puts "#{guard2.punch} #{@@brett.attack}"
          elsif battle == "kick"
            puts "#{guard2.kick} #{@@brett.attack}"
          elsif battle == "rest"
            puts "#{@@brett.rest} #{guard2.rest}"
          elsif @@brett.health == 0
            return 'death'
          else
            puts "I didn't understand, try again."
          end
        end
        puts "NICE JOB."
        puts "You slowly make your way down the corridor. It appears to be the correct way..."
        return 'corridor'

      elsif action2 == "2"
        puts "\n\n"
        puts "You quietly sneak back into the storage room. Guards are now in the pantry room"
        puts "so you decide to sneak down the main corridor."
      else
        puts "Please enter a correct number."
        return 'storage_room'
      end
    elsif action == "3"
      puts "You slowly make your way down the main corridor. It's dimly lit"
      puts "but you take your time and pause before entering any sketchy parts of the corridor."
      puts "This seems to have been the correct way to go..."
    else
      puts "Please enter a number 1 through 3."
      return 'storage_room'
    end

    return 'corridor'
  end
end

class Corridor < Room


  def enter
    guard1 = Guard.new
    puts "\n\n"
    puts "Player's health: #{@@brett.health}"
    puts "Guard's health: #{guard1.guard_health}"
    puts "* " * 30
    puts "You enter the central part of the corridor and a lone guard"
    puts "spots you. He doesn't have any weapons and so he runs at you."
    puts "You both do battle:"
    puts "You can either punch or kick. Type in how you want to attack"
    puts "and then press enter."

    while @@brett.health > 0 && guard1.guard_health > 0
      battle = $stdin.gets.chomp
      if battle == "punch"
        puts "#{guard1.punch} #{@@brett.attack}"
      elsif battle == "kick"
        puts "#{guard1.kick} #{@@brett.attack}"
      elsif battle == "rest"
        puts "#{@@brett.rest} #{guard1.rest}"
      elsif @@brett.health == 0
        return 'death'
      else
        puts "I didn't understand, try again."
      end
    end
    puts "NICE JOB."
    return 'server_room'
  end
end

class ServerRoom < Room
  def enter
    puts "\n\n"
    puts "* " * 30
    puts "\n\n"
    puts "You are now inside the server room. It's quiet and you lock the door"
    puts "behind you so no one enters. You turn on the main computer and see that"
    puts "it's password protected. It says you're allowed 10 guesses for a 3-digit number"
    puts "or else it will self-destruct. Having gone all this way not to abandon"
    puts "the mission, you decide to give it a go...\n\n"
    code = "#{rand(1..3)}#{rand(1..3)}#{rand(1..3)}"
    guess = nil
    counter = 1

    while counter < 10 && guess != code
      counter += 1
      guess = $stdin.gets.chomp
      if guess == "55"
        puts "Secret code entered!"
        return 'last'
      else
        puts "Try again:"
      end
    end

    if guess != code
      puts "I N C O R R E C T..."
      return 'death'
    elsif guess == code
      puts "C O R R E C T."
      puts "System online."
    else
      puts "Nice job."
    end

    return 'last'

  end
end

class Last < Room
  def enter
    puts "\n\n"
    puts "* " * 30
    puts "\n\n"
    puts "Congratualtions!  You won!  You gathered all the intelligence"
    puts "you were set out to get."
    puts "\n" * 2
    puts "* " * 30
    puts "\n" * 3
    puts "________MISSION_COMPLETE________"
    puts "\n" * 3
  end
end

class Death < Room

  @@phrases = [
    "You diiiieeeeeddd!!!!",
    "Ooooohhhhhh nooooooo!!!!",
    "Better luck next time! You died!",
    "G A M E  O V E R."
  ]

  def enter
    puts "\n"
    puts "* " * 30
    puts "\n"
    puts @@phrases[rand(0..3)]
    puts "\n"
    puts "* " * 30
    puts "\n"
    exit(0)
  end
end

class Map

  def initialize(starting_room)
    @rooms = {
      'outside' => Outside.new,
      'storage_room' => StorageRoom.new,
      'corridor' => Corridor.new,
      'server_room' => ServerRoom.new,
      'last' => Last.new,
      'death' => Death.new
    }
    @starting_room = starting_room
  end

  def opening
    return next_room(@starting_room)
  end

  def next_room(next_rooms)
    var = @rooms[next_rooms]
    return var
  end

end

game_map = Map.new('outside')
game_engine = Engine.new(game_map)
game_engine.play
