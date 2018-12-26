class PhotosController < ApplicationController
  before_action :authenticate_user, {only: [:new, :create, :edit, :update, :destroy]}
  def index
    @photos = Photo.all.order(created_at: :desc)
  end

  def show
    @photo = Photo.find(params[:id])
    @photo_tags = @photo.tags
    @user = @photo.user
    @likes_count = Like.where(photo_id: @photo.id).count
  end

  def new
    @photo = Photo.new
  end

  def create
     @photo = Photo.new(
      title: params[:photo][:title],
      image: params[:photo][:image],
      photo_comment: params[:photo][:photo_comment],
      rgb: params[:photo][:rgb],
      user_id: @current_user.id
    )
     # ToDo:時間があったらロールバック処理を追加、データ移行
    if @photo.save!
      @tag = Tag.new(
        name: params[:photo][:tag],
        photo_id: @photo.id
        )
        if @tag.save
          redirect_to("/photos")
        else
          render("photos/new")
        end
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
