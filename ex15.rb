
print "Enter you text file name: "
# Gets an argument for the text file name
filename = gets.chomp

# Opens the text file (but not prints)
txt = open(filename)

# Says the name of the text file
puts "Here's your file #{filename}:"
# Actually displays the text from the file.
print txt.read

txt.close
