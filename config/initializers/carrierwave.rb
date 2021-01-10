CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider: "AWS",
    aws_access_key_id:     ENV["AWS_ACCESS_KEY"],        # required
    aws_secret_access_key: ENV["AWS_SECRET_KEY"],        # required      
    region:                'eu-west-2'
    # endpoint: ENV['AWS_S3_ENDPOINT'],
    # path_style: ENV["FORCE_PATH_STYLE"]
  }
  config.fog_directory  = ENV["AWS_BUCKET"]              # required
  config.fog_public = false
end