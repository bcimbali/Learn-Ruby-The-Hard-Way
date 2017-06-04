
class Scene

  def enter()
    puts "This scene is not yet configured. Subclass it and implement enter()."
    exit(1)
  end
end

class Player

  attr_accessor :health
  def initialize
    @health = 10
  end
end

class Gothon

  attr_accessor :health
  def initialize
    @health = 2
  end
end

class Engine

  def initialize(scene_map)
    @scene_map = scene_map
  end

  def play()
    current_scene = @scene_map.opening_scene()
    last_scene = @scene_map.next_scene('finished')

    while current_scene != last_scene
      next_scene_name = current_scene.enter()
      current_scene = @scene_map.next_scene(next_scene_name)
    end

    # be sure to print out the last scene
    current_scene.enter()
  end
end

class Death < Scene

  @@quips = [
    "You died. You kinda suck at this.",
    "Your mom would be proud...if she were smarter.",
    "Such a luser.",
    "I have a small puppy that's better at this."
  ]

  def enter()
    puts @@quips[rand(0..(@@quips.length - 1))]
    exit(1)
  end
end

class CentralCorridor < Scene

  def enter()
    brett_health = $brett.health
    gothon_health = $gothon.health
    puts "The Gothons of Planet Percal #25 have invaded your ship and destroyed"
    puts "your entire crew. You are the last surviving member and your last"
    puts "mission is to get the neutron destruct bomb from the Weapons Armory,"
    puts "put it in the bridge, and blow the ship up after getting into an "
    puts "escape pod."
    puts "\n"
    puts "You're running down the central corridor to the Weapons Armory when"
    puts "a Gothon jumps out, red scaly skin, dark grimy teeth, and an evil clown costume"
    puts "flowing around his hate filled body. He's blocking the door to the Armory."
    while brett_health > 0 && gothon_health > 0
      puts "How do you want to attack the Gothon?"
      puts "* punch"
      puts "* kick"
      puts "* roll"
      action = $stdin.gets.chomp
      if action == "punch"
        gothon_health = gothon_health - 1
        $gothon.health = gothon_health
      elsif action == "kick"
        gothon_health = gothon_health - 2
        $gothon.health = gothon_health
      elsif action == "roll"
        brett_health = brett_health - 2
        $brett.health = brett_health
      else
        puts "I don't understand. Try attacking again:"
      end
    end
    puts "Brett's current health: #{$brett.health}."
    puts "Gothon's current health: #{$gothon.health}."

    return 'laser_weapon_armory'
  end
end

class LaserWeaponArmory < Scene

  def enter()
    puts "You do a dive roll into the Weapon Armory, crouch and scan the room"
    puts "for more Gothons that might be hiding. It's dead quiet, too quiet."
    puts "You stand up and run to the far side of the room and find the"
    puts "neutron bomb in its container. There's a keypad lock on the box"
    puts "and you need the code to get the bomb out. If you get the code"
    puts "wrong 10 times then the lock closes forever and you can't"
    puts "get the bomb. The code is 3 digits."
    code = "123"
    print "[keypad]> "
    guess = $stdin.gets.chomp
    guesses = 1

    while guess != code && guesses < 10
      puts "BZZZZZEDDDD!"
      guesses += 1
      print "[keypad]> "
      guess = $stdin.gets.chomp
    end

    if guess == code
      puts "The container clicks open and the seal breaks, letting gas out."
      puts "You grab the neutron bomb and run as fast as you can to the"
      puts "bridge where you must place it in the right spot."
      return 'the_bridge'
    elsif guess == "000"
      return 'finished'
    else
      puts "The lock buzzes one last time and then you hear a sickening"
      puts "melting sound as the mechanism is fused together."
      puts "You decide to sit there, and finally the Gothons blow up the"
      puts "ship from their ship and you die."
      return 'death'
    end
  end
end

class TheBridge < Scene

  def enter()
    brett_health = $brett.health
    gothon_health = $gothon2.health
    gothon_health3 = $gothon3.health
    puts "You burst onto the Bridge with the neutron destruct bomb"
    puts "under your arm and surprise 2 Gothons who are trying to"
    puts "take control of the ship. Each of them has an even uglier"
    puts "clown costume than the last. They haven't pulled their"
    puts "weapons out yet, as they see the active bomb under your"
    puts "arm and don't want to set it off. You set it down to activate the bomb."
    puts "With your free hands, you decide to fight these bastards off."
    while brett_health > 0 && gothon_health > 0
      puts "How do you want to attack the Gothon?"
      puts "* punch"
      puts "* kick"
      puts "* roll"
      action = $stdin.gets.chomp
      if action == "punch"
        gothon_health = gothon_health - 1
        $gothon.health = gothon_health
      elsif action == "kick"
        gothon_health = gothon_health - 2
        $gothon.health = gothon_health
      elsif action == "roll"
        brett_health = brett_health - 2
        $brett.health = brett_health
      else
        puts "I don't understand. Try attacking again:"
      end
    end
    puts "Brett's current health: #{$brett.health}."
    puts "First Gothon defeated!"
    while brett_health > 0 && gothon_health3 > 0
      puts "How do you want to attack the Gothon?"
      puts "* punch"
      puts "* kick"
      puts "* roll"
      action = $stdin.gets.chomp
      if action == "punch"
        gothon_health3 = gothon_health3 - 1
        $gothon3.health = gothon_health3
      elsif action == "kick"
        gothon_health3 = gothon_health3 - 2
        $gothon3.health = gothon_health3
      elsif action == "roll"
        brett_health = brett_health - 2
        $brett.health = brett_health
      else
        puts "I don't understand. Try attacking again:"
      end
    end
    puts "Brett's current health: #{$brett.health}."
    puts "Second Gothon defeated!"

    return 'escape_pod'
  end
end

class EscapePod < Scene

  def enter()
    puts "You rush through the ship desperately trying to make it to"
    puts "the escape pod before the whole ship explodes. It seems like"
    puts "hardly any Gothons are on the ship, so your run is clear of"
    puts "interference. You get to the chamber with the escape pods, and"
    puts "now need to pick one to take. Some of them could be damaged"
    puts "but you don't have time to look. There's 5 pods, which one"
    puts "do you take?"

    good_pod = rand(1..5)
    print "[pod #]> "
    guess = $stdin.gets.chomp.to_i

    if guess != good_pod
      puts "You jump into pod %s and hit the eject button." % guess
      puts "The pod escapes out into the void of space, then"
      puts "implodes as the hull ruptures, crushing your body"
      puts "into jam jelly."
      return 'death'
    else
      puts "You jump into pod %s and hit the eject button." % guess
      puts "The pod easily slides out into space heading to"
      puts "the planet below. As it flies to the planet, you look"
      puts "back and see your ship implode then explode like a"
      puts "bright star, taking out the Gothon ship at the same"
      puts "time. You won!"

      return 'finished'
    end
  end
end

class Finished < Scene
  def enter()
    puts "You won! Good job."
  end
end

class Map

  def initialize(start_scene)
    @start_scene = start_scene
  end

  @@scenes = {
    'central_corridor' => CentralCorridor.new(),
    'laser_weapon_armory' => LaserWeaponArmory.new(),
    'the_bridge' => TheBridge.new(),
    'escape_pod' => EscapePod.new(),
    'death' => Death.new(),
    'finished' => Finished.new(),
  }

  def next_scene(scene_name)
    val = @@scenes[scene_name]
    return val
  end

  def opening_scene()
    return next_scene(@start_scene)
  end

  def test_scene
    @@scenes['central_corridor']
  end

end

$brett = Player.new
$gothon = Gothon.new
$gothon2 = Gothon.new
$gothon3 = Gothon.new

a_map = Map.new('central_corridor')

a_game = Engine.new(a_map)

a_game.play
