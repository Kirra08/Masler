class Public::CalendarsController < ApplicationController
  def index
    @calendar = Calendar.new
    @articles = Article.all
    @user = User.find(params[:user_id])


    # params[:start_date]が来ているかをチェック（if）
    unless params[:start_date]
      @calendars = Calendar.where(user_id: params[:user_id]).order(start_time: "desc")
    else
    # start_dateが変数として来ていたら文字列の先頭から7文字分切り出す（2022-05）
      start_date = params[:start_date].slice(0..6)
      # もしもstart_dateが来ていなければDateクラスを使って現在の年月を取得する（2022-06）
      #start_date = Time.zone.now.strftime("%Y-%m")
      #pp "年月", Time.zone.now.strftime("%Y-%m")
      # a == 2022-06
      # 上記で取得した日付でwhere文を作成し、likeで前方一致するデータを取得する
      @calendars = Calendar.where(user_id: params[:user_id]).where("start_time LIKE?", "%#{start_date}%").order(start_time: "desc")
      #binding.pry
    end
  end

  def create
    calendar = Calendar.new(calendar_params)
    calendar.user_id = current_user.id
    calendar.save
  end

  private
   def calendar_params
     params.require(:calendar).permit(:user_id,:set,:article_id,:start_time,:rep,:weight)
   end
end
