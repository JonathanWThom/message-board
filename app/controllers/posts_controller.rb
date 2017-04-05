class PostsController < ApplicationController
  before_action :authenticate_user!, :except => [:index]

  def index
    @posts = Post.all
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def new
    @post = Post.new
    respond_to do |format|
      format.html { posts_path }
      format.js
    end
  end

  def create
    @post = current_user.posts.new(post_params)
    @posts = Post.all
    if @post.save
      respond_to do |format|
        format.html { posts_path }
        format.js
      end
    else
      redirect_to posts_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
