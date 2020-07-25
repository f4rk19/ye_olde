class PhotosController < ApplicationController

  def index
    @photo = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.create(photo_params)
    if @photo.save
      redirect_to user_path(current_user), notice: "Completed"
    else
      flash.now[:alert] = "Uncompleted"
      render new_photo_path
    end
  end

  def destroy
    photo = Photo.find(params[:id])
    if photo.user_id == current_user.id
      if photo.destroy
        redirect_to  hashtags_path, notice: "comleted"
      else
        redirect_to hashtags_path, alert: "uncompleted"
      end
    end
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    photo = Photo.find(params[:id])
    if photo.update(photo_params)
      redirect_to photo_path(params[:id]), notice: "Completed"
    else
      flash.now[:alert] = "Uncompleted"
      render edit_photo_path
    end
  end

  def show
    @photo = Photo.find(params[:id])
    @user = @photo.user
    @comment = Comment.new
    @comments = @photo.comments.includes(:user)
  end

  def hashtags
    @user = current_user
    @tag = Hashtag.find_by(hashname: params[:hashname])
    @photos = @tag.photos.build
    @photo = @tag.photos.page(params[:page])
  end

  private

  def photo_params
    params.require(:photo).permit(:content, :image).merge(user_id: current_user.id)
  end

end