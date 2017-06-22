class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post

  def create
    @comment = @post.comments.build(comment_params)
    @comment.author = current_user

    if @comment.save
      redirect_to post_path(@post), notice: "新增評論成功！"
    else
      redirect_to post_path(@post), alert: "新增評論失敗！"
    end
  end

  def edit
    @comment = current_user.comments.find(params[:id])
  end

  def update
    @comment = current_user.comments.find(params[:id])

    if @comment.update(comment_params)
      redirect_to post_path(@post), notice: "更新評論成功！"
    else
      redirect_to post_path(@post), alert: "更新評論失敗！"
    end
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post), alert: "刪除評論成功！"
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end

  def find_post
    @post = Post.find(params[:post_id])
  end
end
