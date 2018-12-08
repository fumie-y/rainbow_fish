class PhotosController < ApplicationController
  def index
    @photos = Photo.all.order(create_at: :desc)
  end

  def show
    @user = User.find(params[:id])
    @user_posted_photos = @user.photos
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(
      title: params[:title],
      image: "ICAM0006.JPG",
      photo_comment: params[:photo_comment],
      rgb: params[:rgb]
    )
    if @photo.save
      redirect_to("/photos/index")
    else
      render("photos/new")
    end
  end

  private
    def photo_params
      params.require(:photo).permit(:title, :photo_comment, :rgb, :image, :user_id)
    end

  def edit
    @photo = Photo.find(params[:id])
  end


  def update
  end

  def destroy
    redirect_to("/photos/index")
  end
end
