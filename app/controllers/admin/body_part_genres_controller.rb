class Admin::BodyPartGenresController < ApplicationController
  before_action :authenticate_admin!

  def index
    @body_part_genres = BodyPartGenre.all
    @body_part_genre = BodyPartGenre.new
    @gear_genres = GearGenre.all
    @gear_genre = GearGenre.new
  end

  def edit
    @body_part_genre = BodyPartGenre.find(params[:id])
  end

  def update
    @body_part_genre = BodyPartGenre.find(params[:id])

    if @body_part_genre.update(body_part_genre_params)
      @body_part_genres = BodyPartGenre.all
      redirect_to admin_body_part_genres_path
      flash[:notice] = "ジャンルを更新しました"
    else
      render :edit
    end
  end

  def create
    @body_part_genre = BodyPartGenre.new(body_part_genre_params)
    @body_part_genres = BodyPartGenre.all
    if @body_part_genre.save
      flash[:notice] = "ジャンルを作成しました"
    end
  end

  private
  def body_part_genre_params
    params.require(:body_part_genre).permit(:name, :body_part_icon)
  end
end
