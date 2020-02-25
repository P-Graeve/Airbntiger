class PetsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @pets = Pet.all
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_param)
    @pet.save
    redirect_to pets_path
  end

  private

  def pet_param
    params.require(:pet).permit(:name, :price_in_eur, :description, :pet_type)
  end
end
