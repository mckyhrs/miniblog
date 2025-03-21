class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: "DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post].permit(:content))
    if @post.save
      redirect_to posts_path
    else
      render "new", status: :unprocessable_entity
    end
  end
end
