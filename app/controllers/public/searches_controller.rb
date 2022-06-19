class Public::SearchesController < ApplicationController
  def search
    @articles = Article.looks(params[:search], params[:word])
    @gear_genres = GearGenre.all
  end

  def genre_search
    @user = current_user
    @body_part_genres = BodyPartGenre.all
    @gear_genres = GearGenre.all
    if params[:gear_genre_id] && params[:body_part_genre_id].blank?#gear_genreだけで検索したとき
      @articles = Article.where(gear_genre_id: params[:gear_genre_id]).order(created_at: :desc)
    elsif params[:body_part_genre_id] && params[:gear_genre_id].blank?#body_part_genreだけで検索したとき
      @articles = Article.where(body_part_genre_id: params[:body_part_genre_id]).order(created_at: :desc)
    elsif
      params[:gear_genre_id].present? && params[:body_part_genre_id].present?#ジャンル検索機能　ジャンル２つで検索したとき
      @articles = Article.where(body_part_genre_id: params[:body_part_genre_id]).where(gear_genre_id: params[:gear_genre_id]).order(created_at: :desc)
    else
      @articles = Article.all.order(created_at: :desc)
    end
  end
end
