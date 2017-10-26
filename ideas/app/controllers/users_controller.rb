class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create], raise: false
  before_action :require_correct_user, only: [:show, :edit]

  def new
   @user = User.new
  end

  def show
  	@user = User.find(params[:id])
    @posts = Post.where(user_id: params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to bright_ideas_path,  notice: "User was successfully created!"
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to main_path
    end
  end

  private

  def require_correct_user
    if session[:user_id] === nil
      redirect_to main_path
    end
  end

  def user_params
    params.require(:user).permit(:name, :alias, :email, :password, :password_confirmation)
  end

end
