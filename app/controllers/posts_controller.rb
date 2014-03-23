class PostsController < ApplicationController
  def new
    @journey = Journey.find(params[:journey_id])
    @post = @journey.posts.build
  end

  def create
    journey = Journey.find(params[:journey_id])
    post_params = params.require(:post).permit(
      :post_type, :title, :text, :photo, :video, :caption)

    post = journey.posts.create(post_params)

    redirect_to journey_post_path(journey.id, post.id)
  end

  def show
    @journey = Journey.find(params[:journey_id])
    @post = Post.find(params[:id])
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

    post.update_attributes(updated_params)

    redirect_to journey_post_path(journey, post)
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to journey_posts_path(params[:journey_id])
  end
end
