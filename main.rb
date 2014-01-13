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
  puts '2 : Register new client - adopt'
  puts '3 : Show available animals'
  puts '4 : Show adopted animals'
  puts '5 : Update an animal'
  puts '6 : List all clients'
  puts "q : Quit\n\n"
  print '--> '
  gets.chomp
end

message = ""
choice = menu message
while choice != 'q'
  message = ""
  case choice

  when "1"  # new animal - WORKS
    puts "Register a new animal:"
    print "Name: "; name = gets.chomp.to_s
    print "Age: "; age = gets.chomp.to_s
    print "Gender - M / F: "; gender = gets.chomp.to_s
    print "Species - dog / cat / bird / rabbit: "; species = gets.chomp.to_s

    new_animal = Animal.new(name: name, age: age, gender: gender, species: species)
    shelter.animals << new_animal
    message = "Registered new animal: #{new_animal.name} the #{new_animal.species}."


  when "2"  # new client - WORKS, now adding adopt/drop off features

    puts "Register a new client - to adopt"
    print "Name: "; name = gets.chomp.to_s
    print "Age: "; age = gets.chomp.to_s
    print "Number of children: "; num_of_children = gets.chomp.to_s
    print "Number of pets: "; num_of_pets = gets.chomp.to_s
    new_client = Client.new(name: name, age: age, num_of_children: num_of_children, num_of_pets: num_of_pets, to_adopt: true)
    shelter.clients << new_client   #this creates an array of hashes

    shelter.get_available_animals.each do |animal|
      puts "#{animal.name}, #{animal.species}, #{animal.age} y.o."
    end
    print "Name of animal: "; requested_animal_name = gets.chomp
    selected_animal = (shelter.animals.select { |animal| animal.name == requested_animal_name}).first
    selected_animal.owner = new_client
    
    message = "Hooray! #{new_client.name} is now the human of #{selected_animal.name}."
binding.pry


  when "3"  # show available animals - SEMI WORKS, must figure out how to output each line
    available_animals = shelter.get_available_animals()
    available_animals.each do |animal|
      a = "#{animal.name} the #{animal.species}, #{animal.age} years old.\n"
    message += a
   
    end

  # when "4"  # show adopted animals

  # when "5"  # update an animal

  when "6"   # list clients - SEMI WORKS, outputs name in an array
    client_list = shelter.clients
      message += "#{client_list.map { |client| p client.name }}"  #spews out client list as large array

  else
      message += "I don't understand ..."
  end
  choice = menu message
end