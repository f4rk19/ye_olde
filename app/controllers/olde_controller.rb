class OldeController < ApplicationController
  before_action:authenticate_user!

  def index
  end

  def search
    @hashtags = Hashtag.search(params[:keyword])
  end

  def maplist
  end

end
