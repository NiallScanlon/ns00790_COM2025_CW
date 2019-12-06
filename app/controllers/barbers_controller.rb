class BarbersController < ApplicationController
  before_action  only: [:show, :index]

#Defines the index method that can be used to call all of the barbers and display it to the view.
  def index
    @barbers = Barber.all
  end

#Defines the show method that can be used to call the specific barber view.
  def show
    @barber = Barber.find(params[:id])
  end




end
