class Public::FavoritesController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    favorite = current_user.favorites.new(article_id: @article.id)
    favorite.save
  end

  def destroy
    @article = Article.find(params[:article_id])
    favorite = current_user.favorites.find_by(article_id: @article.id)
    favorite.destroy
  end

  def index
    @user =   current_user
    favorites= Favorite.where(user_id: @user.id).order(created_at: :desc).pluck(:article_id)
    @favorite_articles = Article.find(favorites)
    @body_part_genres = BodyPartGenre.all
    @gear_genres = GearGenre.all
  end

end
