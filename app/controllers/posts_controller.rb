class PostsController < ApplicationController
  respond_to :json

  def index
    journey = Journey.find(params[:journey_id])

    respond_with journey.posts
  end

  def new
    @journey = Journey.find(params[:journey_id])
    @post = @journey.posts.build
  end

  def create
    journey = Journey.find(params[:journey_id])
    post_params = params.require(:post).permit(
      :post_type, :title, :text, :photo, :video, :caption)

    respond_with journey.posts.create(post_params)

  end

  def show
    @journey = Journey.find(params[:journey_id])
    @post = Post.find(params[:id])

    respond_with journey: @journey, post: @post
  end

  def edit
    @journey = Journey.find(params[:journey_id])
    @post = @journey.posts.find(params[:id])
    render :new
  end

  def update
    journey = Journey.find(params[:journey_id])
    post = journey.posts.find(params[:id])
    updated_params = params.require(:post).permit(
      :post_type, :title, :text, :photo, :video, :caption)

    respond_with post.update_attributes(updated_params)

    # redirect_to journey_post_path(journey, post)
  end

  def destroy
    respond_with Post.find(params[:id]).destroy
    # redirect_to journey_posts_path(params[:journey_id])
  end
end
