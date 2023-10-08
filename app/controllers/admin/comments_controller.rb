class Admin::CommentsController < ApplicationController

  def index
    # .per(10)の数字で一覧ページに表示するレコード数を変更できる
    @comments = Comment.all.page(params[:page]).per(10)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

end
