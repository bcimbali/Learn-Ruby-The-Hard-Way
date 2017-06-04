# Enter a name for your new text file.
filename = ARGV.first

# Prompts the user to erase the text or not.
puts "We're going to erase #{filename}"
puts "If you don't want that, hit CTRL-C (^C)."
puts "If you do want that, hit RETURN."

# Is the actual code for getting answer
# to the prompt.
$stdin.gets

# Text that states the file is opening.
puts "Opening the file..."

# Creates a variable called target and
# has it open the file and be able to write to it.
target = open(filename, 'w')

formatter = "%{first}\n%{second}\n%{third}"

# Prints out that the program is
# truncating the file.
puts "Truncating the file. Goodbye!"
# Code for truncating or emptieing 'target', which is
# the opened 'filename', which is the name of the text file
# you typed in at the start.
target.truncate(0)

# Prints that it's going to ask you for 3 lines.
puts "Now I'm going to ask you for three lines."

# Asks you to print the first line.
print "line 1: "
line1 = $stdin.gets.chomp
# Asks you to print the second line.
print "line 2: "
line2 = $stdin.gets.chomp
# Asks you to print the third line.
print "line 3: "
line3 = $stdin.gets.chomp

# Says that it's going to write these lines to the file.
puts "I'm going to write these to the file."

# Writes the 3 lines and adds a new line character after
# each line.
linesAll = formatter % {first:line1,second:line2,third:line3}
target.write(linesAll)

# Says that it's going to close the file.
puts "And finally, we close it."
# Code for closing 'target', which is the variable
# for the text file you created.
target.close
