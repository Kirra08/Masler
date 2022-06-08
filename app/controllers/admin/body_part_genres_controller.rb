class Admin::BodyPartGenresController < ApplicationController
  def index
    @body_part_genres = BodyPartGenre.all
  end

  def edit
  end

  def create
    @body_part_genre = BodyPartGenre.new
    @body_part_genre.save
  end

  private
  def body_part_genre_params
    params.require(:body_part_genre).permit(:name)
  end
end
