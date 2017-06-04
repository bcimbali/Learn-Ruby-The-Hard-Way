class Engine

  def initialize(game_layout)
    @game_layout = game_layout
  end

  def play

    puts "\n\n\n"
    puts "/// Welcome to A N T A R C T I C A ///"
    puts "\n\n\n"
    opening_room = @game_layout.opening
    finished = @game_layout.next_room('last')

    while opening_room != finished
      next_room_name = opening_room.enter
      opening_room = @game_layout.next_room(next_room_name)
    end

    # Should return the last room
    finished.enter
  end
end
