class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]


  def index
    if current_user.nil?
      redirect_to '/sign_up'
      flash[:error] ="Please sign in to continue."
    end
    @bookings = Booking.all
  end

  def show
    if current_user.nil?
      redirect_to '/sign_up'
      flash[:error] ="Please sign in to continue."
    end
    @bookings = Booking.all
  end

  # GET /bookings/new
  def new
    if current_user.nil?
      redirect_to '/sign_up'
      flash[:error] ="Please sign in to continue."
    end
    @booking = Booking.new
  end


  def create
    if current_user.nil?
      redirect_to '/sign_up'
      flash[:error] ="Please sign in to continue."
    end
    @booking = Booking.new(booking_params)
    a = '08:00'
    b = '18:00'
    c = @booking.time.strftime('%H:%M')
    if (c).between?(a,b)
       @booking.save
       redirect_to @booking, notice: 'Your booking has been confirmed.'
    else
      redirect_to '/bookings/new'
      flash[:error] = "Please book a time between 8AM and 6PM."
    end
    end


  def update
    if current_user.nil?
      redirect_to '/sign_up'
      flash[:error] ="Please sign in to continue."
    end
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    if current_user.nil?
      redirect_to '/sign_up'
      flash[:error] ="Please sign in to continue."
    end

    if current_user.id == @booking.user_id
    @booking.destroy
    else
    flash[:error] ="You cannot cancel someone elses booking."
    end

    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Your booking was cancelled.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:barber_id, :date, :time, :status, :user_id)
    end
end
