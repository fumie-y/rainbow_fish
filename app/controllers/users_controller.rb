class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def show
  	@user = User.find_by(id: params[:id])
  end

  def likes_photo
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
  end

  def update
  end

  def login_form
  end

  def login
  end

  def logout
  end

  def destory
  end
  
end
