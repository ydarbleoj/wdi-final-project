class ImageWorker 

  # def perform(post_id)

  #   post = Post.find(params[:id])



  #    AWS.config({
  #                :access_key_id     => ENV['S3_KEY'],
  #                :secret_access_key => ENV['S3_SECRET']
  #   })

  #   #The s3 variable is creating a new connection to the S3 cloud storage.
  #   s3 = AWS::S3.new
  #   bucket_name = "wdi-final-project" #This is the repository for images on the amazon account.
  #   "public#{post.photo.url}"
  #   File.basename("public#{post.photo.url}")
  #   bucket = s3.buckets[bucket_name]
  #   s3.buckets["wdi-final-project"].objects[File.basename("public#{post.photo.url}")].write(:file => "public#{post.photo.url}")
  #   post.update_attributes(photo_link: "https://s3.amazonaws.com/goodevil/"+"#{post.photo.filename}")
  #   File.delay_for(2.minutes).delete("#{Rails.root}/public#{post.photo.url}")


  # end 

end