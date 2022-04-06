class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments).order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.author
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)

    respond_to do |format|
      if @post.save
        flash[:notice] = 'Post created successfully. 👍'
        format.html { redirect_to user_posts_url(current_user.id) }
      else
        flash[:notice] = 'Post creation failed. Try again'
        format.html { render :new }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    user = User.find(params[:user_id])
    user.posts_counter -= 1
    @post.destroy!
    user.save
    flash[:success] = 'You have deleted this post!'
    redirect_to user_posts_path(user.id)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
