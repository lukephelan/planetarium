class PlanetsController < ApplicationController
  def index
    @planets = Planet.all
  end

  def show
    @planet = Planet.find(params[:id])
    # respond_to do |format|
    #   format.html { render 'planets/show' }
    #   format.json { render json: @planet.to_json }
    # end
  end

  def new
    @planet = Planet.new
  end

  def edit
    @planet = Planet.find(params[:id])
  end

  def create
    @planet = Planet.create planet_params

    if @planet.valid?
      redirect_to planets_path
    else
      redirect_to new_planet_path, :flash => { :errors =>
        @planet.errors.full_messages.join('. ') }
    end
  end

  def planet_params
    params.required(:planet).permit(:name, :diameter, :rings, :moons, :order,
    :explored, :image, :distance_from_sun, :atmosphere, :solid)
  end

  def update
    @planet = Planet.find(params[:id])
    if @planet.update(planet_params)
      redirect_to @planet
    else
      redirect_to new_planet_path, :flash => { :errors =>
        @planet.errors.full_messages.join('. ') }
    end
  end

  def destroy
    @planet = Planet.find(params[:id])
    @planet.destroy

    redirect_to planets_path
  end
  
end
