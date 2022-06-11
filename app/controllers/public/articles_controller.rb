class Public::ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @article_comment = ArticleComment.new
    @article_comments = ArticleComment.all
  end

  def edit
    @article = Article.find(params[:id])
    @gear_genres = GearGenre.all
    @body_part_genres = BodyPartGenre.all
  end

  def update
    @gear_genres = GearGenre.all
    @body_part_genres = BodyPartGenre.all
    @article = Article.find(params[:id])
    @article.update(article_params)
    redirect_to article_path(@article)
  end

  def new
    @article = Article.new
    @gear_genres = GearGenre.all
    @body_part_genres = BodyPartGenre.all
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to articles_path
  end

  def destroy
  end

  private
  def article_params
    params.require(:article).permit(:title, :text, :article_image, :body_part_genre_id, :gear_genre_id, :article_genre ,:user_id)
  end
end
