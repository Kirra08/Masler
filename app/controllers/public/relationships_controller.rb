class Public::RelationshipsController < ApplicationController

  def create
    current_user.follow(params[:user_id])
    @user = User.find(params[:user_id])
  end

  def destroy
    current_user.unfollow(params[:user_id])
    @user = User.find(params[:user_id])
  end

  def library
    @articles = Article.where(user_id: [*current_user.following_ids])
    @body_part_genres = BodyPartGenre.all
    @gear_genres = GearGenre.all
  end

  def followings
    @user = User.find(params[:user_id])
    @users = @user.followings
  end

  def followers
    @user = User.find(params[:user_id])
    @users = @user.followers
  end
end
