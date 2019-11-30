class BarbersController < ApplicationController
  before_action :set_barber, only: [:show]


  def index
    @barbers = Barber.all
  end


  def show

  end

    # Use callbacks to share common setup or constraints between actions.
    def set_barber
      @barber = Barber.find(params[:id])
    end

end
