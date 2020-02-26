class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(user: current_user)
  end

  def create
    # create new booking with permitted params
    # check if checkboxes are all ticked (&&)
    @pet = Pet.find(params[:pet_id])
    if params[:take_care_of_pet].present? && params[:dont_kill_pet].present? && params[:contact_owner].present? &&  params[:agree_to_terms].present? == true
      @booking = Booking.new
      @booking.user = current_user
      @booking.pet = @pet
      @booking.start_date = Date.parse('14/2/2020')
      @booking.end_date = Date.parse('18/2/2020')
      if @booking.save
        redirect_to bookings_path
      else
        redirect_to pet_path(@pet, success: false, messages: @pet.errors.full_messages)
      end
    else
      # redirect to show path of this specific @pet
      redirect_to pet_path(@pet, success: false)
    end
  end

  # private
#
  # def booking_params
     # params.require(:booking).permit(:date)
#
  # end
end
