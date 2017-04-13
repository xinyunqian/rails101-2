class Account::PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = current_user.posts
  end

  def edit
    @group = Group.find(params[:group_id])
    @post = Post.find(params[:group_id])
  end

  def update
    @group = Group.find(params[:group_id])
    @post = Post.find(params[:group_id])
    if @post.update(post_params)
      redirect_to posts_path, notice: "Update Success"
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

end
