# Sets the variable "input file" to the First
# argument that's entered on the command line
input_file = ARGV.first
# Defines a method called "print all" that
# reads the whole file that's passed in from the argument
# and puts/prints it out to the screen.
def print_all(f)
  puts f.read
end

# Defines a method that moves the file pointer
# to the beginning of the document without reading
# or writing to the file.
def rewind(f)
  f.seek(0)
end

# Defines a method that puts/prints one line
# depending on where the line count or file pointer
# is positioned. It prints out the line number and then
# the text on the line without the new line action.
def print_a_line(line_count, f)
  puts "#{line_count}, #{f.gets.chomp}"
end

# A variable for the opened input file, which is
# the file name passed into the arguemnt vector at the
# very start of the program.
current_file = open(input_file)

# Text that says it's printing the whole text with a new line
# character.
puts "First let's print the whole file:\n"

# Uses the print all method we made but on the
# file we passed into the program at the command line.
print_all(current_file)

# States that we're going to rewind the file.
puts "Now let's rewind, kind of like a tape."

# Calls the rewind method we defined earlier but
# on the file passed to it on the command line argument.
rewind(current_file)

# States we're going to print three lines.
puts "Let's print three lines:"

# Sets a variable called current line and has it
# start on line 1 and calls the print a line method
# on the it to print the line number and the text for the line.
current_line = 1
print_a_line(current_line, current_file)

# Does the same as above but just advances it to the next line
# in the text.
current_line += 1
print_a_line(current_line, current_file)

# Same as previous code.
current_line += 1
print_a_line(current_line, current_file)
