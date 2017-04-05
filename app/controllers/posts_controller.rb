class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all
    @post = current_user.posts.new
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      redirect_to posts_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
