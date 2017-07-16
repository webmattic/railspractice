class PostsController < ApplicationController

  before_action :find_posts, only: [:show, :edit, :update, :destroy]


  def index
    @posts = Post.all.order('created_at DESC')
  end
  def new
    @post = Post.new
  end
  def create
    @post = Post.new(posts_params)

    if @post.save
        redirect_to @post
    else
        render 'New'
    end
  end
  def update
    if @post.update(posts_params)
        redirect_to @post
    else
        redirect_to 'Edit'
    end
  end
  def show
  end
  def edit
  end
  def destroy
    @post.destroy
    redirect_to root_path
  end

  private

  def posts_params
    params.require(:post).permit(:title, :content, :company)
  end

  def find_posts
    @post = Post.find(params[id])
  end
end
