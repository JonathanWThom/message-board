class PostsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @posts = Post.order(created_at: :desc).paginate(:page => params[:page], :per_page => 5)
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.order(created_at: :desc)
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
    @posts = Post.order(created_at: :desc).paginate(:page => params[:page], :per_page => 5)
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
