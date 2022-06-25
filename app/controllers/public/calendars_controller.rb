class Public::CalendarsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @calendar = Calendar.new
    @articles = Article.all
    @user = User.find(params[:user_id])
    # params[:start_date]が来ているかをチェック（if）
    unless params[:start_date]
      now_date = Time.zone.now.strftime("%Y-%m")
      @calendars = Calendar.where(user_id: params[:user_id]).where("start_time LIKE?", "%#{now_date}%").order(start_time: "desc").page(params[:page]).per(8)
    else
      start_date = params[:start_date].slice(0..6)
      @calendars = Calendar.where(user_id: params[:user_id]).where("start_time LIKE?", "%#{start_date}%").order(start_time: "desc").page(params[:page]).per(8)
    end
  end

  def create
    @calendar = Calendar.new(calendar_params)
    @calendar.user_id = current_user.id
    @user = User.find(params[:user_id])
    if @calendar.save
      now_date = Time.zone.now.strftime("%Y-%m")
      @calendars = Calendar.where(user_id: params[:user_id]).where("start_time LIKE?", "%#{now_date}%").order(start_time: "desc")
      flash[:notice] = "スケジュールを投稿しました"
    else
      @calendars = []
    end
  end

  def destroy
    @calendar = Calendar.find(params[:id])
    @user = User.find(params[:user_id])
    now_date = Time.zone.now.strftime("%Y-%m")
    @calendars = Calendar.where(user_id: params[:user_id]).where("start_time LIKE?", "%#{now_date}%").order(start_time: "desc")
    @calendar.destroy
    flash[:notice] = "スケジュールを削除しました"
  end

  private
   def calendar_params
     params.require(:calendar).permit(:user_id,:set,:article_id,:start_time,:rep,:weight)
   end
end
