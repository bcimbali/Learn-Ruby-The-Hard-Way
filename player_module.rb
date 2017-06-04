module PlayerModule

  attr_accessor :var1

  class Player
    attr_accessor :health

    def initialize
      @health = 10
    end

    def attack
      @health -= rand(0..1)
      puts "Updated Player Health: #{@health}."
    end

    def rest
      @health += 1
      puts "Updated Player Health: #{@health}."
    end

  end

  class Guard
    attr_accessor :guard_health

    def initialize
      @guard_health = 2
    end

    def punch
      @guard_health -= rand(0..1)
      puts "Updated Guard health: #{@guard_health}."
    end

    def kick
      @guard_health -= rand(0..2)
      puts "Updated Guard health: #{@guard_health}."
    end

    def rest
      @guard_health += rand(0..1)
      puts "Updated Guard health: #{@guard_health}."
    end
  end
end
