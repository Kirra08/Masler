class Public::ArticlesController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def new
  end

  def create
  end

  def destroy
  end

  private
  def article_params
    params.require(:article).permit(:title, :text, :article_image, :body_part_genre_id, :gear_genre_id, :article_genre ,:user_id)
  end
end
