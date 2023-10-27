class User::CommentsController < ApplicationController

  def index
    # .per(10)の数字で一覧ページに表示するレコード数を変更できる
    @comments = Comment.all.page(params[:page]).per(10)
  end

  def my_index
    @comments = Comment.where(user_id: current_user.id).includes(:user).order("created_at DESC")
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = @post.id
    @comment.save

    @comments = @post.comments.page(params[:page]).per(10)
    respond_to :js
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    @post = Post.find(params[:post_id])
    @comments = @post.comments.page(params[:page]).per(10)
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :post_id, :content)
  end
end