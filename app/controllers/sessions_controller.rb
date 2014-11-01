class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    @user = User.find_by_credentials(params[:user][:name],
                                    params[:user][:password])
    if @user.nil?
      flash.now[:errors] ||= []
      flash.now[:errors] << "Bad Email/Password combination"
      render :new
    else
      sign_in!(@user)
      flash[:messages] ||= []
      flash[:messages] << "Welcome back, #{@user.name}!"
      redirect_to new_user_sub_url(@user)
    end                                    
  end
  
  def destroy
    sign_out
    redirect_to new_session_url
  end
end
