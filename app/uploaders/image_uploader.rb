# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  process :resize_to_limit => [600, 600]
  process :convert => 'jpg'

  version :thumb do
    process :resize_to_limit => [300, 300]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def filename
    super.chomp(File.extname(super)) + '.jpg' if original_filename.present?
  end

  def filename
    time = Time.now
    name = time.strftime('%Y%m%d%H%M%S') + '.jpg'
    name.downcase
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end
