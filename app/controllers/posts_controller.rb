class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :redirect_unless_creator!, only: [:edit, :update, :destroy]


  def index
    @posts = Post.all.order(created_at: :desc).limit(5)
  end
  
  def show
   
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path, notice: 'しおりが投稿されました。'
    else
      render :new
    end
  end

  def edit
      @post.image01.cache! unless @post.image01.blank?
      @post.image02.cache! unless @post.image02.blank?
      @post.image03.cache! unless @post.image03.blank?
  end

  def update
    # 既存の学習メモ情報を更新する処理
    if @post.update(post_params)
      redirect_to root_path, notice: 'しおりが更新されました。'
    else
      render :edit
    end
  end

  def destroy
    @post.remove_image01!
    @post.save
    # 特定の学習メモを削除する処理
    @post.destroy
    redirect_to root_path, notice: 'しおりが削除されました。'
  end

  private

  def post_params
    params.require(:post).permit(:title, :summary, :items, :budget, :start_time, :end_time, :text, :image01, :image02, :image03,:image_cache,
:remove_image01, :remove_image02, :remove_image03).merge(user_id: current_user.id)
  end
  

  def set_post
    @post = Post.find(params[:id])
  end
  
  def redirect_unless_creator!
    redirect_to root_path unless @post.user == current_user
  end
  
end

