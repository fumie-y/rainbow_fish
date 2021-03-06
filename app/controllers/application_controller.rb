class ApplicationController < ActionController::Base
  before_action :set_current_user
  before_action :set_search

  def set_search
    @search = Photo.ransack(params[:q])
    @search_word = params[:q]
  end
  
  # 現在ログイン中のユーザーを常に表示
  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  # アクセス制限
  def authenticate_user
    if @current_user == nil
      flash[:notice] = 'ログインが必要です'
      redirect_to("/login")
    end
  end

  # ログインユーザーがアクセスできない
  def forbid_login_user
    if @current_user
      flash[:notice] = 'ログイン中です'
      redirect_to("/photos")
    end
  end
end
