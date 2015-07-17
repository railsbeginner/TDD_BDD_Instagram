class PostsController < ApplicationController
	before_filter :authenticate_user!, only: [:new]
  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(posts_params)
  	@post.save
  	redirect_to root_path, notice: 'Post has been created'
  end

  def index
  	@posts = Post.all
  end

  private

  def posts_params
  	params.require(:post).permit(:title)
  end
end