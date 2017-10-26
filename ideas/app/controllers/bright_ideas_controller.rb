class BrightIdeasController < ApplicationController

  def index
    @posts = 
      Post
        .left_joins(:joins)
        .group(:id)
        .order('COUNT(joins.id) DESC')
        .limit(10)
  end

  def create
    post = Post.new post_params
    unless post.save
      flash[:errors] = post.errors.full_messages
    end
    redirect_to bright_ideas_path
  end

  def show
    @post = Post.find params[:id] 
    @user = @post.users.distinct  
        
  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:post_id])
    @post.destroy
    redirect_to bright_ideas_path
  end

  private
    def post_params
      params.permit(:content).merge(user: current_user)
    end
end
