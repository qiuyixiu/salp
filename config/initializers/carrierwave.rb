CarrierWave.configure do |config|
  config.storage              = :aliyun
  config.aliyun_access_id     = "xxxxxx"
  config.aliyun_access_key    = "xxxxxx"
  config.aliyun_bucket        = "xxxx"
  config.aliyun_host          = "xxxx"
  config.aliyun_internal      = false
  config.aliyun_area          = "cn-shenzhen"
  config.aliyun_private_read  = true

end
