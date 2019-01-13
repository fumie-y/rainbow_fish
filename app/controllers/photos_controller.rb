class PhotosController < ApplicationController
  before_action :authenticate_user, {only: [:new, :create, :edit, :update, :destroy]}
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}

  # @searchはapplication_controllerのset_searchメソッドで定義
  def index
    @photos = @search.result.page(params[:page]).per(4).order('created_at DESC')
  end

  def show
    @photo = Photo.find(params[:id])
    @other_photos = Photo.where(user_id: @photo.user_id).where.not(id: params[:id])
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
    if @photo.save
      @tag = Tag.new(
        name: params[:photo][:tag],
        photo_id: @photo.id
        )
        if @tag.save
          flash.now[:notice] = '写真を投稿しました'
          redirect_to("/photos")
        else
          render("photos/new")
        end
    else
      @error_message = 'タイトルや写真情報を入力して下さい'
      render("photos/new")
    end
  end

  def edit
    @photo = Photo.find(params[:id])
  end


  def update
    @photo = Photo.find(params[:id])
    @photo.title = params[:photo][:title]
    @photo.photo_comment = params[:photo][:photo_comment]
    @photo.rgb = params[:photo][:rgb]
    if @photo.save
      tag = Tag.find_or_initialize_by(photo_id: @photo.id)
      tag.update_tag(params[:photo][:tags_attributes].values)
      tag.save
      flash.now[:notice] = '写真を編集しました'
      redirect_to("/photos/#{@photo.id}")
    else
      @error_message = 'タイトルは必ず入力して下さい'
      render("/photos/#{@photo.id}/edit")
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    flash.now[:notice] = '写真を削除しました'
    redirect_to("/photos")
  end


  # private
  # def search_params
  #   params.require(:q).permit!
  # end

  def ensure_correct_user
    @photo = Photo.find(params[:id])
    if @photo.user_id != @current_user.id
      flash.now[:notice] = '権限がありません'
      redirect_to("/photos")
    end

  end
end
