class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  storage :file

  process :resize_to_fit => [480, 320]

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end 

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def filename 
    "#{secure_token}.#{file.extension}" if original_filename.present? 
  end 

  protected 
  def secure_token 
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
  end 

end 

