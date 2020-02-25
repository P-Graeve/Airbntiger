class PetsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    # check if params are present
    if params[:query].present?
      @pets = Pet.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @pets = Pet.all
    end
  end
end
