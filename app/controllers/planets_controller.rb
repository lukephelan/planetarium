class PlanetsController < ApplicationController
  def index
  end

  def new
  end

  def create
    planet = Planet.create planet_params
    redirect_to planets_path
  end

  def planet_params
    params.required(:planet).permit(:name, :diameter, :rings, :moons, :order,
    :explored, :image, :distance_from_sun, :atmosphere, :solid)
  end
end
