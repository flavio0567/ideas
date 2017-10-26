class MainsController < ApplicationController
  def new
    # render login page
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to bright_ideas_path
    else
      flash[:errors] = ["Invalid Authentication"]
      redirect_to  main_path
    end
  end

  def destroy
    # Log User out
    session[:user_id] = nil
    redirect_to  main_path
  end

end
