class AttachmentUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick
  include CarrierWave::Audio
  include CarrierWave::Video
  # include ::CarrierWave::Backgrounder::Delay
  # include CarrierWave::Video::Thumbnailer
  # include CarrierWave::FFmpeg
  

  
  # Choose what kind of storage to use for this uploader:
  # storage :file
  storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  # def store_dir
  #   "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  # end

  # version :video, if: :video? do
  #   process encode_video: [:mp4] #, callbacks: { after_transcode: :set_success } ]
  # end

  # Create different versions of your uploaded files:
  version :thumb, if: :image? do
    process resize_to_fit: [80, 80]
  end

  # version :small_thumb, from_version: :thumb do
  #   process resize_to_fill: [20, 20]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_whitelist
    %w(mp4 mp3 jpg jpeg gif png pdf docx)
  end

  protected
  
  def image?(new_file)
    new_file.content_type.include? 'image' if new_file.content_type
  end
end
