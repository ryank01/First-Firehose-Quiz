class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.create(car_params)
    if @car.save
      flash[:notice] = 'Saved successfully.'
      redirect_to root_path
    else
      flash[:error] = '<strong>Could not save</strong> the data you entered is invalid.'
      render :new
    end
  end
end

def car_params
  params.require(:car).permit(:make,:model,:year)
end