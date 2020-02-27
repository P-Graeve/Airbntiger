class PetsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    # check if params are present
    if params[:query].present?
      @pets = Pet.search(params[:query])
    else
      @pets = Pet.all
    end
  end

  def show
    # check if something didnt work
    if params[:success] == 'false'
      @error = true
    end
    @booking = Booking.new
    @pet = find_pet
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = current_user
    if @pet.save
      redirect_to pets_path
    else
      render :new
    end
  end

  def edit
    @pet = find_pet
    if @pet.user == current_user
    else
      redirect_to pet_path(@pet)
    end
  end

  def update
    @pet = find_pet
    @pet.update(pet_params)
    redirect_to pet_path(@pet)
  end

  def destroy
    @pet = find_pet
    @pet.destroy
    redirect_to pets_path
  end

  private

  def find_pet
    Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name, :price_in_eur, :description, :pet_type, photos: [])
  end

end
