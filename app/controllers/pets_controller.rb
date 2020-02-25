class PetsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :new]

  def index
    @pets = Pet.all
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    if @pet.save
      redirect_to pets_path
    else
      render :new
    end
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :price_in_eur, :description, :pet_type)
  end
end
