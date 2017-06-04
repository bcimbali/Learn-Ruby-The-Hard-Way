stuff = "3 91234"
@words = stuff.split
@direction = ['north', 'south', 'east', 'west',
  'left', 'right', 'back', 'up']
@verbs = ['go', 'stop', 'kill', 'eat']
@stops = ['the', 'in', 'of', 'from', 'at', 'it']
@nouns = ['door', 'bear', 'princess', 'cabinet']
@numbers = (0..10_000).to_a.join
@sentence = []

@words.each do |word|
  if @direction.include? word
    @sentence.push ['direction', word]
    next
  elsif @verbs.include? word
    @sentence.push ['verb', word]
    next
  elsif @stops.include? word
    @sentence.push ['stop', word]
    next
  elsif @nouns.include? word
    @sentence.push ['noun', word]
    next
  else @numbers.include? word
    begin
      num = Integer(word)
      @sentence.push ['number', num]
    rescue
      next
    end

  end
end

# print @sentence

@directionUp = @direction.map { |word| word.capitalize}
print @directionUp
