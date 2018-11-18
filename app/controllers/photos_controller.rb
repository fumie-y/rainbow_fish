class PhotosController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    @photo = Photo.new(
      image: "ICAM0011.JPG",
      user_id: @current_user.id
    )
  end

  def update
  end

  def destroy
  end
  
end
