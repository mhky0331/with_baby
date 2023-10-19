class User::PostsController < ApplicationController

before_action :ensure_user, only: [:edit, :update, :destroy]

  def index
    # .per(10)の数字で一覧ページに表示するレコード数を変更できる
    if params[:all]
      @posts = Post.all.page(params[:page]).per(10)
    else
      @posts = params[:equipment_id].present? ? Equipment.find(params[:equipment_id]).facilities : Facility.all
    end
    if params[:keyword] != ""
      if @facility = Facility.find_by(name:params[:keyword])
        @posts = @facility.posts.page(params[:page])
      else
        @posts = Post.page(params[:page])
      end
    else
      @posts = Post.page(params[:page])
    end
    @keyword = params[:keyword]
  end

  def show
    @post = Post.find(params[:id])
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
  end

  def update
      if @post.update(post_params)
         redirect_to user_posts_path(@post.id)
      else
         render :edit
      end
  end

  def destroy
    @post.destroy
    redirect_to user_posts_path
  end


  private

  def post_params
    params.require(:post).permit(:user_id, :content, :posted_photo)
  end

  def ensure_user
    @posts = current_user.posts
    @post = @posts.find_by(id: params[:id])
    redirect_to user_posts_path(@post.id) unless @post
  end

end