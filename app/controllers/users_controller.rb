class UsersController < ApplicationController
  def new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      sign_in!(@user)
      flash[:messages] ||= []
      flash[:messages] << "Welcome, #{@user.name}!"
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end
  
  def show
    
  end
  
  
    
  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
