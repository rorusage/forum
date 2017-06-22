class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post, only: [:show]

  def index
    @posts = Post.all
  end

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to post_path(@post), notice: "新增文章成功！"
    else
      render :new
    end
  end

  def show
    @comments = @post.comments.all.order("created_at DESC")
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])

    if @post.update(post_params)
      redirect_to post_path(@post), alert: "更新文章成功！"
    else
      render :edit
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    redirect_to posts_path, alert: "刪除文章成功！"
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
