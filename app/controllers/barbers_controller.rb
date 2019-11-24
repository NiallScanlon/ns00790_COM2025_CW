class BarbersController < ApplicationController
  before_action :set_barber, only: [:show, :edit, :update, :destroy]


  def index
    @barbers = Barber.all
  end


  def show

  end

    # Use callbacks to share common setup or constraints between actions.
    def set_barber
      @barber = Barber.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def barber_params
      params.require(:barber).permit(:name, :phone, :email)
    end
end
