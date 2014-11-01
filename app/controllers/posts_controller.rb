class PostsController < ApplicationController
  before_action :post_owner, only: [:edit, :update]
  
  def new
    @sub = Sub.find(params[:sub_id])
  end
  
  def create
    @post = current_user.posts.new(post_params)
    @post.sub_id = params[:sub_id]
    if @post.save
      flash[:messages] ||= []
      flash[:messages] << "Post Created!"
      redirect_to subs_url
    else
      flash.now[:errors] ||= []
      flash.now[:errors] << @post.errors.full_messages
      render :new     
    end
  end
  
  def edit
    @post = current_user.posts.find(params[:id])
  end
  
  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      flash[:messages] ||= []
      flash[:messages] << "Post Updated!"
      redirect_to sub_url(@post.sub_id)
    else
      flash.now[:errors] ||= []
      flash.now[:errors] << @sub.errors.full_messages
      render :edit
    end
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  private
  def post_owner
    @post = Post.find(params[:id])
    unless @post.author_id == current_user.id
      redirect_to subs_url
    end
  end
  
  def post_params
    params.require(:post).permit(:title, :url, :content)
  end
end
