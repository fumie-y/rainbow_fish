class PhotosController < ApplicationController
  def index
    @photos = Photo.all.order(created_at: :desc)
  end

  def show
    @photo = Photo.find(params[:id])
    @photo_tags = @photo.tags
    @user = @photo.user
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(
      title: params[:photo][:title],
      image: "ICAM0006.JPG",
      photo_comment: params[:photo][:photo_comment],
      rgb: 'R',
      user_id: '1'
    )
    if @photo.save
      redirect_to("/photos")
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
