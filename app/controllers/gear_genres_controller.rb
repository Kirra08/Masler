class GearGenresController < ApplicationController
  def index
  end

  def edit
  end

  def new
  end

  def create
  end

  private
  def gear_genre_params
    params.reruire(:gear_genre).permit(:name)
  end
end
