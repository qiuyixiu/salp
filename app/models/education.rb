class Education < ApplicationRecord
  mount_uploader :image, ImageUploader
  is_impressionable

  belongs_to :user
  validates :title, presence: true
end
