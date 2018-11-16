class PhotosController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    @photo = Photo.new(
      image: params[:image],
      user_id: @current_user.id
    )
  end

  def update
  end

  def destroy
  end
  
end
