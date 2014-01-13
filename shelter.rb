class Shelter
	attr_accessor :name, :address, :animals, :clients

	def initialize(name, address, animals = [], clients = [])
		@name = name
		@address = address
		@animals = animals
		@clients = clients
	end

 	def get_available_animals
 		@animals.select do |animal|
 			animal.is_adopted?
 		end
 	end

 end