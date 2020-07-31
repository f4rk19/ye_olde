class UsersController < ApplicationController
  def index
    return nil if params[:keyword] ==""
    @users =User.where(['name LIKE ?', "%#{params[:keyword]}%"]).where.not(id: current_user.id).limit(10)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def edit
    user = User.find(params[:id])
    @image = user.image
  end

  def update
    @user = User.find_by(id: params[:id])
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
    @photos = @user.photos.order(created_at: "DESC").page(params[:page]).per(24)
    @name = @user.name
    @image = @user.image
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :image)
  end
end
