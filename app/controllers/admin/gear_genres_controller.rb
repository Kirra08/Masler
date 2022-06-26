class Admin::GearGenresController < ApplicationController
  before_action :authenticate_admin!

  def index
    @gear_genres = GearGenre.all
    @gear_genre = GearGenre.new
  end

  def edit
    @gear_genre = GearGenre.find(params[:id])
  end

  def update
    @gear_genre = GearGenre.find(params[:id])
    if @gear_genre.update(gear_genre_params)
      @gear_genres = GearGenre.all
      redirect_to admin_body_part_genres_path
      flash[:notice] = "ジャンルを更新しました"
    else
      render :edit
    end
  end

  def new
  end

  def create
    @gear_genres = GearGenre.all
    @gear_genre = GearGenre.new(gear_genre_params)
    if @gear_genre.save
      flash[:notice] = "ジャンルを作成しました"
    end
  end

  private
  def gear_genre_params
    params.require(:gear_genre).permit(:name, :gear_genre_icon)
  end
end
