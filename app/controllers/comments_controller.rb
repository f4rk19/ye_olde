class CommentsController < ApplicationController

def create
  @comment = Comment.create(comment_params)
  if @comment.save
    respond_to do |format|
      format.html{redirect_to "/photos/#{@comment.photo.id}",notice:"completed"}
      format.json
    end
  else
    flash.now[:alert] = 'Write a comment'
    render "/photos/#{@comment.photo.id}"
  end
end

def destroy
  comment = Comment.find(params[:id])
  if comment.user_id == current_user.id
    if comment.destroy
      flash[:success]="Completed"
      redirect_to photo_path(params[:photo_id])
    else
      redirect_to photo_path(params[:photo_id])
    end
  end
end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, photo_id: params[:photo_id])
  end

end
