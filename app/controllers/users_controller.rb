class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:index, :show, :edit, :update]}
  before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}
  before_action :ensure_correct_user, {only: [:edit, :update]}

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
      name: params[:user][:name],
      password: params[:user][:password_digest],
      profile_image: "default_user.jpg"
    )
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = 'ユーザー登録が完了しました'
      redirect_to("/users/#{@user.id}")
    else
      render("/users/new")
    end
  end

  def edit
    @user = User.find(params[:id])
  end


  def users_params
    params.require(:user).permit(:name, :profile_image, :password_digest)
  end

  def update
    @user = User.find(params[:id])
    @user.name = params[:user][:name]
    @user.password = params[:user][:password_digest]
    @user.profile_image = params[:user][:profile_image]
      if @user.update(users_params)
      flash[:notice] = 'ユーザー情報を編集しました'
      redirect_to("/users/#{@user.id}")
      else
        render :edit
      end
  end

  def login_form
  end

  def login
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      flash[:notice] = 'ログインしました'
      redirect_to("/photos")
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

  def destroy_form
    @user = User.find(params[:id])
  end

  def destory
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = 'ユーザー削除しました'
      redirect_to("/users")
    else
      render("/users/#{@user.id}/destroy_form")
    end
  end

  def ensure_correct_user
    if params[:id].to_i != @current_user.id
      flash[:notice] = '権限がありません'
      redirect_to("/photos")
    end
  end
end