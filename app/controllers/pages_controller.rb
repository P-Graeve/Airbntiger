class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    # check if there is a notice (signed up successfully) but no current user -> something went wrong
    if notice == "Welcome! You have signed up successfully." && !current_user
      redirect_to new_user_registration_path(error: true)
    end
  end
end
