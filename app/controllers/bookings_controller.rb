class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(user: current_user)
    @past_bookings = @bookings.where('end_date < ?', Date.today)
    @upcoming_bookings = @bookings.where('end_date > ?', Date.today)
  end

  def create
    # create new booking with permitted params
    # check if checkboxes are all ticked (&&)
    @pet = Pet.find(params[:pet_id])
    if params[:take_care_of_pet].present? && params[:dont_kill_pet].present? && params[:contact_owner].present? &&  params[:agree_to_terms].present? == true
      @booking = Booking.new
      @booking.user = current_user
      @booking.pet = @pet
      s_year = booking_params["start_date(1i)"]
      s_month = booking_params["start_date(2i)"]
      s_day = booking_params["start_date(3i)"]
      e_year = booking_params["end_date(1i)"]
      e_month = booking_params["end_date(2i)"]
      e_day = booking_params["end_date(3i)"]
      @booking.start_date = Date.parse("#{s_day}/#{s_month}/#{s_year}")
      @booking.end_date = Date.parse("#{e_day}/#{e_month}/#{e_year}")
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

  private

  def booking_params
    params.require(:booking).permit("start_date(1i)", "start_date(2i)", "start_date(3i)", "end_date(1i)", "end_date(2i)", "end_date(3i)")
  end
end
