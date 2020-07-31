class BookmarksController < ApplicationController
  before_action :set_photo, only: %i[create destroy]

  def index
    @bookmarks = Bookmark.where(user_id: current_user.id).all
    @user = current_user
    @bookmark_photos = @user.bookmark_photos.order(created_at: "DESC").page(params[:page]).per(24)
  end

  def create
    @bookmark = current_user.bookmarks.new(photo_id: params[:photo_id])
    if @bookmark.save
      redirect_to photo_path(params[:photo_id]),notice: "Added to your bookmark"
    else
      redirect_to photo_path(params[:photo_id]),alert: "Umcompleted"
    end
  end

  def destroy
    @bookmark = Bookmark.find_by(user_id: current_user.id,photo_id: params[:photo_id])
    if @bookmark.destroy
      redirect_to photo_path(params[:photo_id]),notice:"Removed from your bookmark"
    else
      redirect_to photo_path(params[:photo_id]),alert: "Uncompleted"
    end
  end

  private

  def set_photo
    @photo = Photo.find(params[:photo_id])
  end
end
