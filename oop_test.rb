# Loads or 'requires' the functionality in the wrapper library 'open-uri'
# open-uri provides a different way to use http or ftp connections
# as if they were files.
require 'open-uri'

# Creates a constant variable for the url in which the words are listed
WORD_URL = "http://learncodethehardway.org/words.txt"
# Creates a constant variables called WORDS and sets it to an empty array.
WORDS = []

# Creates a constant variable called PHRASES and sets it to a hash.
PHRASES = {
  "class ### < ###\nend" =>
       "Make a class named ### that is-a ###.",
  "class ###\n\tdef initialize(@@@)\n\tend\nend" =>
       "class ### has-a initialize that takes @@@ parameters.",
  "class ###\n\tdef ***(@@@)\n\tend\nend" =>
       "class ### has-a function named *** that takes @@@ parameters.",
  "*** = ###.new()" =>
       "Set *** to an instance of class ###.",
  "***.***(@@@)" =>
       "From *** get the *** function, and call it with parameters @@@.",
  "***.*** = '***'" =>
       "From *** get the *** attribute and set it to '***'."
}

# Creates a constant variable called PHRASE_FIRST and says
# If the first command-line argument is the word/string, "english",
# Then set it to the constant variable, PHRASE_FIRST.
# Otherwise, I believe it doesn't create the variable? Not sure.
PHRASE_FIRST = ARGV[0] == "english"

# Opens the url as a file that's stored in the constant variable, WORD_URL. Ruby can
# do this because the open-uri wrapper allows you to open URLs as files.
# Creates a block and sets a block variable to f. From f (the IO file), the each_line method
# executes the block for every line. A nested block sets a block variable to |word| and
# ,from the WORDS array, calls the push method to append the word (string) to the end of the array.
# The word variable as a string has the chomp method called on it to remove the carriage return.
open(WORD_URL) {|f|
  f.each_line {|word| WORDS.push(word.chomp)}
}

# Create a function that's called "craft_names" and that takes 4 parameters.
# Create a variable called "names" and set it to the result of this: the string "snippet" is
# scanned for a matching pattern that is provided in the "pattern" parameters
# ,which, for every matching pattern, that string is added into an array. THEN,
# that array has .map called on it (which iterates through each element and
# passes them one-by-one to a block like .each, but .map
# allows you to modify the elements in the array). It goes into the do end block,
# which is the same as { }, takes a variable called "word" and sets it to the usage of .pop
# on the array of "rand_words" to return the last element in the array. Then it goes
# into a conditional statement using the ternary operators ?: which asks,
# "if caps is true, then run word.capitalize, otherwise just return "word."
# Finally, after that block, it returns the "names" array times 2.
def craft_names(rand_words, snippet, pattern, caps=false)
  names = snippet.scan(pattern).map do
    word = rand_words.pop()
    caps ? word.capitalize : word
  end

  return names * 2
end

def craft_params(rand_words, snippet, pattern)
  names = (0...snippet.scan(pattern).length).map do
    param_count = rand(3) + 1
    params = (0...param_count).map {|x| rand_words.pop()}
    params.join(', ')
  end

  return names * 2
end

def convert(snippet, phrase)
  rand_words = WORDS.sort_by {rand}
  class_names = craft_names(rand_words, snippet, /###/, caps=true)
  other_names = craft_names(rand_words, snippet, /\*\*\*/)
  param_names = craft_params(rand_words, snippet, /@@@/)

  results = []

  [snippet, phrase].each do |sentence|
    # fake class names, also copies sentence
    result = sentence.gsub(/###/) {|x| class_names.pop }

    # fake other names
    result.gsub!(/\*\*\*/) {|x| other_names.pop }

    # fake parameter lists
    result.gsub!(/@@@/) {|x| param_names.pop }

    results.push(result)
  end

  return results
end

# keep going until they hit CTRL-D
loop do
  snippets = PHRASES.keys().sort_by {rand}

  for snippet in snippets
    phrase = PHRASES[snippet]
    question, answer = convert(snippet, phrase)

    if PHRASE_FIRST
      question, answer = answer, question
    end

    print question, "\n\n> "

    exit(0) unless $stdin.gets

    puts "\nANSWER: %s\n\n" % answer
  end
end
