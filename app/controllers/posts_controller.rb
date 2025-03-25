class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path, notice: '投稿を作成しました'
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.expect(post: %i[content])
  end
end
