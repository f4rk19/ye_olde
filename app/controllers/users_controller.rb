class UsersController < ApplicationController
  def index
    @users = User.page(params[:page])
  end

  def edit
  end

  def update
    @user = User.find_by(id: params[:id])
    if params[:image]
      @user.image = "{@user.id}.jpg"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.image}",image.read)
    end
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
    @photos = @user.photos.order("created_at DESC").page(params[:page]).per(10)
    @name = @user.name
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :image)
  end
end
