require 'base64'
require 'openssl'
require 'digest/sha1'

class PostsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :json

  def index
    journey = Journey.find(params[:journey_id])

    respond_with journey.posts
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
    journey = Journey.find(params[:journey_id])
    post = Post.find(params[:id])

    respond_with journey: journey, post: post
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
          key: key
        }.to_json
      }
    end
  end



  protected

  def key
    "users/#{current_user.to_param}/#{Time.now.to_s}"
  end


  def s3_upload_policy_document
    return @policy if @policy

    ret = { "expiration" => "5.minutes.from_now.xmlschema",
      "conditions" => [
        { "bucket" => 'wdi-final-project' },
        # [ "starts-with", "$key", @journey. ], # need fix
        { "acl" => 'public' },
        { "success_action_status" => "200" },
        [ "content-length-range", 0, 1048576 ]
      ]
    }
    @policy = Base64.encode64(ret.to_json).gsub(/\n/,'')
  end


  def s3_upload_signature
    signature = Base64.encode64(OpenSSL::HMAC.digest(OpenSSL::Digest::Digest.new('sha1'), 'l9j+XoBWdSkeIjYgjlv6pA3BUHC7w/ysMmpS/klo', s3_upload_policy_document)).gsub("\n","")
  end

end
