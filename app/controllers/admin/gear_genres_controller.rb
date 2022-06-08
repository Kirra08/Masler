class Admin::GearGenresController < ApplicationController
  def index
    @gear_genres = GearGenre.all
    @gear_genre = GearGenre.new
  end

  def edit
    @gear_genre = GearGenre.find(params[:id])
  end

  def update
    @gear_genre = GearGenre.find(params[:id])
    @gear_genre = GearGenre.update(gear_genre_params)
    redirect_to admin_gear_genres_path
  end

  def new
  end

  def create
    @gear_genres = GearGenre.all
    @gear_genre = GearGenre.new(gear_genre_params)
    @gear_genre.save
    redirect_to  request.referer
  end

  private
  def gear_genre_params
    params.require(:gear_genre).permit(:name)
  end
end
