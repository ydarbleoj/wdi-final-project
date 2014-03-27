class ImageWorker 

  def perform(post_id)

    post = Post.find(params[:id])



     AWS.config({
                 :access_key_id     => ENV['S3_KEY'],
                 :secret_access_key => ENV['S3_SECRET']
    })

    #The s3 variable is creating a new connection to the S3 cloud storage.

  end 

end