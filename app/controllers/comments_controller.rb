class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    post = Post.find(params[:post_id])
    comment = post.comments.new(body: comment_params[:body], user_id: current_user.id)
    if comment.save
      flash[:notice] = 'Comment Saved'
      ## js
      redirect_to post_path(post)
    else
      redirect_to post_path(post)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
