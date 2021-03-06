class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:index, :show, :edit, :update]}
  before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}
  before_action :ensure_correct_user, {only: [:edit, :update]}

  # indexはURL => /usersで表示される
  def index
    @users = User.page(params[:page]).per(10).order('created_at DESC')
  end

  def show
    @user = User.find(params[:id])
    @user_posted_photos = @user.photos
  end

  def likes_photos
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(
      name: params[:user][:name],
      password: params[:user][:password],
      password_confirmation: params[:user][:password_confirmation],
    )
    if password_authenticate?(params[:user]) && @user.save
      session[:user_id] = @user.id
      flash.now[:notice] = 'ユーザー登録が完了しました'
      redirect_to("/users/#{@user.id}")
    else
      @error_message = '再度どちらも入力して下さい'
      render("/users/new")
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.name = params[:user][:name]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    @user.profile_image = params[:user][:profile_image]
    if @user.save
      flash.now[:notice] = 'ユーザー情報を編集しました'
      redirect_to("/users/#{@user.id}")
    else
      @error_message = 'ユーザー情報を入力して下さい'
      render :edit
    end
  end

  def login_form
  end

  def login
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      flash.now[:notice] = 'ログインしました'
      redirect_to("/photos")
    else
      @error_message = "再度どちらも入力して下さい"
      render("users/login_form")

    end
  end

  def logout
    session[:user_id] = nil
    flash.now[:notice] = 'ログアウトしました'
    redirect_to("/login")
  end

  def destroy_form
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash.now[:notice] = 'ユーザーを削除しました'
      redirect_to("/login")
    else
      render("/users/#{@user.id}/destroy_form")
    end
  end

  private

    def password_authenticate?(user)
      user[:password].present? && @user.authenticate(user[:password])
    end

  # def user_params
  #   params.require(:user).permit(:name, :profile_image, :password, :password_digest)
  # end

  def ensure_correct_user
    if params[:id].to_i != @current_user.id
      flash.now[:notice] = '権限がありません'
      redirect_to("/photos")
    end
  end
end
