class PostsController < ApplicationController
  
  before_action :authenticate_user!

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    if @post = Post.create(post_params)
      flash[:success] = "Your post has been created!"
      redirect_to posts_path
    else
      flash.now[:alert] = "There was an error, please try again"
      render :new
    end
  end

  def show

  end

  def edit

  end

  def update
    if @post.update(post_params)
      flash[:success] = "Post updated!"
      redirect_to posts_path
    else 
      flash.now[:alert] = "Update failed, please check the form."
      render :edit
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "Post deleted!"
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:image, :caption)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
