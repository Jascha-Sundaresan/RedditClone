class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    user = User.find_by_credentials(params[:user][:name],
                                    params[:user][:password])
    if user.nil?
      flash.now[:errors] = @user.errors.full_messages
      render :new
    else
      sign_in!(user)
      flash[:welcome] ||= []
      flash[:welcome] << "Welcome back, #{@user.name}!"
      redirect_to root
    end                                    
  end
  
  def destroy
    sign_out
    redirect_to new_session_url
  end
end
