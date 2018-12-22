class UsersController < ApplicationController
 # アクセス制限（編集後表示する）
 # before_action :authenticate_user, {only: [:edit, :update]}

 # ログインユーザーがアクセス禁止（編集後表示する）
 # before_action :forbid_login_user, {only: [:new, :creste, :login_form, :login]}

  # indexはURL => /usersで表示される
  def index
    @users = User.all
    p 'ああああああああああテスト'
    p 'ああああああああああテスト'
    p 'ああああああああああテスト'
  end

  def show
    @user = User.find(params[:id])
    @user_posted_photos = @user.photos
  end

  def likes_photos
    @user = User.find(params[:id])
    @user_posted_photos = @user.photos
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(
      name: params[:name],
      password: params[:password],
      profile_image: "default_user.jpg"
    )
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = 'ユーザー登録が完了しました'
      redirect_to = ("/users/#{@user.id}")
    else
      render = ("/users/new")
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  end

  def login_form
  end

  def login

    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      flash[:notice] = 'ログインしました'
      #本来の遷移先は"/photos"だがエラーになってしまうため
      #仮のリダイレクト先として、"/users"を指定している
      #エラーはphoto_newブランチで訂正してるので
      #loginブランチをマージ後はエラーは解消出来るはずです

      #redirect_to("/photos")
      #下記コードはloginマージ後に削除する
      redirect_to("/users")
    else
      @error_message = "再度どちらも入力して下さい"
      #TODO: 初期値の表示をするかどうかは後で決める
      # @name = params[:name]
      # @password = params[:password]
      render("users/login_form")

    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = 'ログアウトしました'
    redirect_to("/login")
  end

  def password_update
    @user = User.find(params[:id])
  end

  def destroy_form
  end

  def destory
  end
end
