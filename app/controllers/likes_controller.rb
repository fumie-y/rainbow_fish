class LikesController < ApplicationController
  before_action :authenticate_user

  def create
    @like = Like.new(
      user_id: @current_user.id,
      photo_id: params[:photo_id]
      )
    @like.save
    redirect_to("/photos/#{params[:photo_id]}")
  end

  def destroy
    @like = Like.find_by(
      user_id: @current_user.id,
      photo_id: params[:photo_id]
      )
    @like.destroy
    redirect_to("/photos/#{params[:photo_id]}")
  end
end
