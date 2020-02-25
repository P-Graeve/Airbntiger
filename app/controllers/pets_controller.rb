class PetsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    # check if params are present
    if params[:query].present?
      @pets = Pet.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @pets = Pet.all
    end
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

  def show
    @pet = Pet.find(params[:id])
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :price_in_eur, :description, :pet_type)
  end


end
