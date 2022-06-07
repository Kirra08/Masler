class BodyPartGenreController < ApplicationController
  def index
  end

  def edit
  end

  def new
  end

  def create
  end

  private
  def body_part_genre_params
    params.require(:body_part_genre).permit(:name)
  end
end
