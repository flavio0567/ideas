class JoinsController < ApplicationController

  def create
    Join.create join_params
    redirect_to bright_ideas_path
  end  

  def destroy
    @post = Post.find(params[:@post_id])
    @join = Join.where(user: current_user, post: @post)
    @join.destroy(@join)
    redirect_to bright_ideas_path
  end

  private
    def join_params
      params.require(:join).permit(:post_id).merge(user: current_user)
    end
end
