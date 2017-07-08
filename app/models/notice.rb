class Notice < ApplicationRecord
  mount_uploader :image, ImageUploader
  is_impressionable
end
