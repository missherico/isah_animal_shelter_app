require './animal'
require './client'
require './shelter'

require 'pry'

shelter = Shelter.new("Happi Trails", "123 Wagging Tail Way")


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
while choice != 'q'
  message = ""
  case choice
  when "1"  # new animal
    puts "Register a new animal:"
    print "Name: "; name = gets.chomp.to_s
    print "Age: "; age = gets.chomp.to_s
    print "Gender - M / F: "; gender = gets.chomp.to_s
    print "Species - dog / cat / bird / rabbit: "; species = gets.chomp.to_s

    new_animal = Animal.new(name: name, age: age, gender: gender, species: species)
    shelter.animals << new_animal
    message = "Registered new animal: #{new_animal.name} the #{new_animal.species}."


  when "2"  # new client

    puts "Register a new client:"
    print "Name: "; name = gets.chomp.to_s
    print "Age: "; age = gets.chomp.to_s
    print "Number of children: "; num_of_children = gets.chomp.to_s
    print "Number of pets: "; num_of_pets = gets.chomp.to_s

    new_client = Client.new(name: name, age: age, num_of_children: num_of_children, num_of_pets: num_of_pets)
    shelter.clients << new_client
    message = "Registered new client: #{new_client.name}."


  # when "3"  # show available animals

  # when "4"  # show adopted animals

  # when "5"  # update an animal

  else
      message += "I don't understand ..."
  end
  choice = menu message
end