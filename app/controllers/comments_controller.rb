class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.find(params[:post_id])
    @comments = @post.comments.order(created_at: :desc)
    @comment = @post.comments.new
    respond_to do |format|
      format.html { post_path(@post) }
      format.js
    end
  end

  def create
    @post = Post.find(params[:post_id])
    @comments = @post.comments.order(created_at: :desc)
    @comment = @post.comments.new(body: comment_params[:body], user_id: current_user.id)
    if @comment.save
      @comment = Comment.new
      flash[:notice] = 'Comment Saved'
      respond_to do |format|
        format.html { post_path(@post) }
        format.js
      end
    else
      flash[:notice] = 'Something went wrong!'
      redirect_to post_path(@post)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
