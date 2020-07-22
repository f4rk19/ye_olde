class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def edit
  end

  def update
    @user = User.find_by(id: params[:id])
    if current_user.update(user_params)
      redirect_to hashtags_path
    else
      render :edit
    end
    if params[:image]
      @user.image = "{@user.id}.jpg"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.image}",image.read)
    end
  end

  def show
    @user = User.find(params[:id])
    @photos = @user.photos.order("created_at DESC")
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :image)
  end
end