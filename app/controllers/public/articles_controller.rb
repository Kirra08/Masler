class Public::ArticlesController < ApplicationController
  def index
    @articles = Article.all.order(created_at: :desc)
    @user = current_user
    @body_part_genres = BodyPartGenre.all
    @gear_genres = GearGenre.all
  end

  def show
    @article = Article.find(params[:id])
    @article_comment = ArticleComment.new
    @article_comments = ArticleComment.where(article_id: @article)
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
    if @article.save
      flash[:notice] = "投稿しました"
      redirect_to articles_path
    else
      render :new
      @gear_genres = GearGenre.all
      @body_part_genres = BodyPartGenre.all
    end
  end

  def destroy
    @article =Article.find(params[:id])
    @article.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title, :text, :article_image, :body_part_genre_id, :gear_genre_id, :article_genre ,:user_id,:article_image2,:article_image3,:article_image4, :method1_text, :method2_text, :method3_text, :method4_text)
  end
end
