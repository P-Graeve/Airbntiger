class PetsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @pets = Pet.all
  end
end
