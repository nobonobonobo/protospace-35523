class CommentsController < ApplicationController

  def create
    @comments = Comment.new(comment_params)
    if @comments.save
      redirect_to "/prototypes/#{@comments.prototype.id}"
    else
      @prototype = @comments.prototype
      @comments = @prototype.comments
      render "comments/new"
    end
  end

  private 

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
