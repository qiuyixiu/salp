CarrierWave.configure do |config|
  config.storage              = :aliyun
  config.aliyun_access_id     = ENV["aliyun_access_id"]
  config.aliyun_access_key    = ENV["aliyun_access_key"]
  config.aliyun_bucket        = "yixiu2017"
  config.aliyun_internal      = false
  config.aliyun_area          = "cn-shenzhen"
  config.aliyun_host          = "https://yixiu2017.oss-cn-shenzhen.aliyuncs.com"
  config.aliyun_private_read  = false
end
