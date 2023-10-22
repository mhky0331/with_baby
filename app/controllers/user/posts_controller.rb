class User::PostsController < ApplicationController

before_action :ensure_user, only: [:edit, :update, :destroy]

  def index
    # .per(10)の数字で一覧ページに表示するレコード数を変更できる
    if params[:all]
      @posts = Post.all.page(params[:page]).per(10)
    else
      @posts = params[:equipment_id].present? ? Equipment.find(params[:equipment_id]).posts.page(params[:page]) : Post.all
    end
    if params[:keyword] != ""
      if @facility = Facility.find_by(name:params[:keyword])
        @posts = @facility.posts.page(params[:page])
      else
        @posts = Post.page(params[:page])
      end
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
    @facility = Facility.find(params[:facility_id])
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.facility_id = Facility.find(params[:facility_id]).id
    equipment_ids = params[:equipment_ids].compact_blank
    equipment_ids.each {|id| @post.post_equipments.build(equipment_id: id) }
      if @post.save
         redirect_to user_post_path(@post.id)
      else
         @posts = Post.all
         @post = Post.new
         @facility = Facility.find(params[:facility_id])
         render :new
      end
  end

  def edit
  end

  def update
      if @post.update(post_update_params)
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

  def post_update_params
    params.require(:post).permit(:user_id, :content, :equipment, :posted_photos)
  end

  def post_params
    params.permit(:user_id, :content, :equipment, posted_photos: [])
  end

  def ensure_user
    @posts = current_user.posts
    @post = @posts.find_by(id: params[:id])
    redirect_to user_posts_path(@post.id) unless @post
  end

end