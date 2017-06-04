puts "You enter a room and see 2 stuffed foxes. What do you do?"
puts "1. Say hello to the foxes."
puts "2. Walk over to the foxes."
puts "3. Leave the room."

print "> "
decision = $stdin.gets.chomp

if decision == "1"
  puts "The foxes make a sound but don't look your way. What do you do?"
  puts "1. Ask them what their names are."
  puts "2. Leave the room."

  print "> "
  foxes = $stdin.gets.chomp

  if foxes == "1"
    puts "The foxes make a sound and look your way. You can't make out what their names are."
    puts "What do you do?"
    puts "1. Pet the foxes."
    puts "2. Burn sage."

    print "> "
    critical = $stdin.gets.chomp

    if critical == "1"
      puts "The foxes smile and you whisper the words \"squishy\"."
    elsif critical == "2"
      puts "The foxes give you rare crystalz. Max healing n' happiness!!11!!11!1111!"
    else
      puts "Understandable. The foxes fall asleep but then you wake up from a dream."
    end
  elsif foxes == "2"
    puts "You leave the room and never see the foxes again. They remain a mystery."
  else
    puts "The foxes stand up and run out of the room."
  end

elsif decision == "2"
  puts "The foxes look at you and smile."
  puts "What do you do?"
  puts "1. Hug the foxes."
  puts "2. Ask them how there day is."

  print "> "
  tree = $stdin.gets.chomp

  if tree == "1"
    puts "The foxes are happy and you hug for hourz."
  elsif tree == "2"
    puts "The foxes say it's been a rough day. They surprise you with their rough Boston accent."
  else
    puts "The foxes fall asleep."
  end
elsif decision == "3"
  puts "You leave the room and never see the foxes again."
elsif decision == "7"
  puts "The foxes ask you to draw a Tarot card. What do you do?"
  puts "1. Draw a card."
  puts "2. Say no thanks and walk away."

  print "> "
  tarot = $stdin.gets.chomp

  if tarot == "1"
    puts "You get the 7 of foxes card and have an uneblievably good fortune. Your life will be great."
  elsif tarot == "2"
    puts "The foxes are upset that you didn't take a card. The foxes hiss at you."
  else
    puts "You fall over and go unconcious."
  end 
else
  puts "You fall over and go unconcious."
end
