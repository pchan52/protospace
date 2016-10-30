class PrototypeImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process :resize_to_fit => [64, 64]
  end

  storage :fog

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
