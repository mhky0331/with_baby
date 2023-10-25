class User::CommentsController < ApplicationController

  def index
    # .per(10)の数字で一覧ページに表示するレコード数を変更できる
    @comments = Comment.all.page(params[:page]).per(10)
  end

  def create
    post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = post.id
    @comment.save
  end

  def destroy
    @comment = Comment.find(params[:post_id])
    @comment.destroy
    @post = Post.find(params[:post_id])
  end

  private

  def comment_params
    params.permit(:user_id, :post_id, :content)
  end
end