require './shelter'
require './animal'
require './client'

shelter = Shelter.new("Happi Tails Shelter", "415 Wag the Dog Way")

def menu message
  puts `clear`
  puts "*** Welcome to Happi Tails Control Center ***\n\n"

  puts "#{message}\n\n" unless message.empty?

  puts '1 : Register new animal'
  puts '2 : Register new client'
  puts '3 : Show available animals'
  puts '4 : Show adopted animals'
  puts '5 : Update an animal'
  puts "q : Quit\n\n"
  print '--> '
  gets.chomp
end

message = ""
choice = menu message

