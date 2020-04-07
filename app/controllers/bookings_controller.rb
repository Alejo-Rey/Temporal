class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :update, :destroy]

  # GET /bookings
  def index
    @bookings = Booking.all

    render json: @bookings
  end

  # GET /bookings/1
  def show
    render json: @booking
  end

  # GET /bookings/resume
  def resume
    @bookings = Booking.bookings_resume(params[:day])
    render json: @bookings
  end

  # POST /bookings
  def create
    if booking_params[:function_id]
      @function = Function.find(booking_params[:function_id])
      if @function.bookings.count == 10
        render json: {mssg: "Full function"}
        return
      else
        if @user = User.find_by(identification: booking_params[:identification])
          binding.pry
          booking_params_hash = booking_params.merge({user_id: @user.id})
          @booking = Booking.new(booking_params_hash.except(:identification, :name, :email) )
        else
          binding.pry
          @user = User.new(booking_params.slice(:identification, :name, :email))
          @user.save
          booking_params_hash = booking_params.merge({user_id: @user.id})
          @booking = Booking.new(booking_params_hash.except(:identification, :name, :email))
        end
      end
    end
    

    if @booking.save
      render json: @booking, status: :created, location: @booking
    else
      render json: @booking.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bookings/1
  def update
    if @booking.update(booking_params)
      render json: @booking
    else
      render json: @booking.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bookings/1
  def destroy
    @booking.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def booking_params
      params.require(:booking).permit(:day, :function_id, :identification, :name, :email)
    end

    def user_params
      params.permit(:identification, :name, :email)
    end
end
