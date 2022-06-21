class Admin::BodyPartGenresController < ApplicationController
  def index
    @body_part_genres = BodyPartGenre.all
    @body_part_genre = BodyPartGenre.new
  end

  def edit
    @body_part_genre = BodyPartGenre.find(params[:id])
  end

  def update
    @body_part_genre = BodyPartGenre.find(params[:id])
    @body_part_genre = BodyPartGenre.update(body_part_genre_params)
    redirect_to admin_body_part_genres_path
  end

  def create
    @body_part_genre = BodyPartGenre.new(body_part_genre_params)
    @body_part_genre.save
    redirect_to  request.referer
  end

  private
  def body_part_genre_params
    params.require(:body_part_genre).permit(:name, :body_part_icon)
  end
end
