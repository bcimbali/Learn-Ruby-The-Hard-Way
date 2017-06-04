


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

class Fight
  def play
    puts "This battle is not configured. Subclass it and override it."
    exit(1)
  end
end


class Battle < Fight

  def initialize(brett, gothon)
    @brett = brett
    @gothon = gothon
  end


  def play
    brett_health = @brett.health
    gothon_health = @gothon.health

    while brett_health > 0 && gothon_health > 0
      puts "How do you want to attack the Gothon?"
      puts "* punch"
      puts "* kick"
      puts "* roll"
      action = $stdin.gets.chomp
      if action == "punch"
        gothon_health = gothon_health - 1
        @gothon.health = gothon_health
      elsif action == "kick"
        gothon_health = gothon_health - 2
        @gothon.health = gothon_health
      elsif action == "roll"
        brett_health = brett_health - 2
        @brett.health = brett_health
      else
        puts "I don't understand. Try attacking again:"

      puts "Brett Health: #{brett_health}."
      puts "Gothon Health: #{gothon_health}."
      end
    end
    puts "End of battle."
    puts "Brett: #{@brett.health}."
    puts "Gothon: #{@gothon.health}"

  end
end

brett = Player.new()
gothon = Gothon.new()
gothon2 = Gothon.new()

battle1 = Battle.new(brett, gothon)
battle2 = Battle.new(brett, gothon2)

battle1.play
battle2.play
