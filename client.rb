class Client

	attr_accessor :shelter, :name, :age, :num_of_children, :num_of_pets, :to_adopt, :to_drop_off

	def initialize(params = {})
		@shelter = shelter
		@name = params[:name]
		@age = params[:age]
		@num_of_children = params[:num_of_children]
		@num_of_pets = params[:num_of_pets]
		@to_adopt = params[:to_adopt]
		@to_drop_off = params[:to_drop_off]

	end

    

end