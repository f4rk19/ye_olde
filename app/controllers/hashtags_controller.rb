class HashtagsController < ApplicationController

  before_action:authenticate_user!

  def index
  end

  def search
    @hashtags = Hashtag.search(params[:keyword])
    @tag = Hashtag.find_by(hashname: params[:name])
  end

end
