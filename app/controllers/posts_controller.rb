require 'base64'
require 'openssl'
require 'digest/sha1'


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

  def post_url(url)
    return url
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

  def render_new_photo
    respond_to do |format|
      format.json {
        render json: {
          policy: s3_upload_policy_document, 
          signature: s3_upload_signature, 
          key: key, 
          AWSAccessKeyId: AWS.config.access_key_id
        }.to_json
      }
    end
  end 



  protected

  def key
    "users/#{current_user.to_param}/#{Time.now.to_i}"
  end


  def s3_upload_policy_document
    return @policy if @policy 

    ret = { 
      "expiration" => 5.minutes.from_now.xmlschema, 
      "conditions" => [
        { "bucket" => 'wdi-final-project' }, 
        [ "starts-with", "$key", "" ], # need fix 
        { "acl" => 'public-read' }, 
        [ "starts-with", "$Content-Type", ""],
        [ "starts-with", "$success_action_status", ""],
        [ "content-length-range", 0, 1048576 ]
      ]
    }
    @policy = Base64.encode64(ret.to_json).gsub(/\n/,'')
  end 


  def s3_upload_signature
    Base64.encode64(
      OpenSSL::HMAC.digest(
        OpenSSL::Digest::Digest.new('sha1'),
        AWS.config.secret_access_key, s3_upload_policy_document)
      )
    .gsub("\n","")
  end 




end
