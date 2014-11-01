class SubsController < ApplicationController

  def new
    @user = current_user
  end
  
  def create
    @sub = current_user.subs.new(sub_params)
    if @sub.save
      flash[:messages] ||= []
      flash[:messages] << "Sub Created!"
      redirect_to subs_url
    else
      flash.now[:errors] ||= []
      flash.now[:errors] << sub.errors.full_messages
      render :new      
    end
  end
  
  def show
    @sub = Sub.find(params[:id])
  end
  
  def index
    @subs = Sub.all
  end
  
  def destroy
    @subs = Sub.find(params[:id])
    @subs.try(:delete)
    redirect_to subs_url
  end
  
  def edit
    @sub = Sub.find(params[:id])
  end
  
  def update
    @sub = current_user.subs.find(params[:id])
    if @sub.update(sub_params)
      flash[:messages] ||= []
      flash[:messages] << "Sub Updated!"
      redirect_to subs_url
    else
      flash.now[:errors] ||= []
      flash.now[:errors] << @sub.errors.full_messages
      render :edit
    end
  end
  
  def sub_params
    params.require(:sub).permit(:title, :description)
  end
  
  
end
