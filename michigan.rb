cities = {
  'Genesee' => 'Flint',
  'Washtenaw' => 'Ann Arbor',
  'Wayne' => 'Detroit',
  'Bay' => 'Bay City',
  'Kent' => 'Grand Rapids',
  'Marquette' => 'Marquette'
}

puts "The big city in Wayne County is #{cities['Wayne']}!"

puts '~' * 20

cities.each do |x, y, z|
  puts "In #{x} county, the big city is: #{y}."
end
