CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              'AWS',                       
    aws_access_key_id:     ENV['AWS_ACCESS_KEY_ID'],                       
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],                     
    use_iam_profile:       true,                        
    region:                ENV['AWS_REGION'],                 
    host:                  ENV['AWS_HOST'] 
  }
  config.fog_directory  = ENV['AWS_BUCKET']                                    
  config.fog_public     = false                                                 
  config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" } 
end