class Admin::PostsController < ApplicationController

  def index
    # .per(10)の数字で一覧ページに表示するレコード数を変更できる
    @posts = Post.all.page(params[:page]).per(10)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path
  end

end
