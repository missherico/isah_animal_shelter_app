class Animal
  attr_accessor :shelter, :name, :age, :gender, :species, :toys, :owner, :dropped_off_by

  def initialize(params = {})
    @shelter = shelter
    @name = params[:name]
    @age = params[:age]
    @gender = params[:gender]
    @species = params[:species]
    @toys = params[:toys]
    @owner = params[:owner]
    @dropped_off_by = params[:dropped_off_by]
  end

  def is_adopted?
    @owner.nil?
  end




end
