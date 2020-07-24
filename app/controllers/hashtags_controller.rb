class HashtagsController < ApplicationController

  def index
    return nil if params[:keyword] == ""
    @hashtags = Hashtag.where(['hashname LIKE ?',"#{params[:keyword]}%"]).limit(10)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
    @hashtag = Hashtag.find_by!(hashname: params[:hashname])
    @photos = @hashtag.photos.page(params[:page]).per(12)
  end

  def search
    @hashtags = Hashtag.search(params[:keyword])
    @photos = PhotoHashtag.where(hashtag_id: @hashtags).includes(:user)
  end

end
