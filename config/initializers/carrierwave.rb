CarrierWave.configure do |config|
  config.storage              = :aliyun
  config.aliyun_access_id     = ENV["aliyun_access_id"]
  config.aliyun_access_key    = ENV["aliyun_access_key"]
  config.aliyun_bucket        = ENV["aliyun_bucket"]
  config.aliyun_host          = "https://oss-cn-shenzhen.aliyuncs.com"
  config.aliyun_internal      = false
  config.aliyun_area          = "cn-shenzhen"
  config.aliyun_private_read  = false

end
