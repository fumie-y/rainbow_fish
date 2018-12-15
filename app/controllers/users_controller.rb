class UsersController < ApplicationController
  # indexはURL => /usersで表示される
  def index
    @users = User.all
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
    @user = User.find_by(name: params[:name], password: params[:password])
    if @user #&& @user.authenticate(params[:password])
      #session[:user_id] = @user.id
      flash[:notice] = 'ログインしました'
      redirect_to('/photos')
    else
      @error_message = "ユーザー名とパスワードを入力して下さい"
      render('users/login_form')
    end
  end

  def logout
  end

  def password_update
    @user = User.find(params[:id])
  end

  def destroy_form
  end

  def destory
  end
end
