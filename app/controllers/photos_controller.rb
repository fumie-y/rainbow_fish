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
      image: params[:photo][:image],
      photo_comment: params[:photo][:photo_comment],
      rgb: params[:photo][:rgb],
      # TODO: @current_userはapplication_controller.rbで定義してる
      # loginマージ後再度下記コードを試す
      # user_id: @current_user.id
      user_id: 2
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
