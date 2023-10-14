class User::PostsController < ApplicationController

  def index
    # .per(10)の数字で一覧ページに表示するレコード数を変更できる
    @posts = Post.all.page(params[:page]).per(10)
  end

  def show
    @post = post.find(params[:id])
    @comment = Comment.new
    @comments = Comment.all.page(params[:page]).per(10)
  end

  def new
    @post = Post.new
  end

  def create
    @posts = Post.new(post_params)
      if @post.save
         redirect_to user_posts_path(@post.id)
      else
         @posts = Post.all
         render :new
      end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
      if @post.update(post_params)
         redirect_to user_posts_path(@post.id)
      else
         @posts = Post.all
         render :edit
      end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
  end


  private

  def post_params
    params.require(:post).permit(:user_id, :content, :posted_photo)
  end

end