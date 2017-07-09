class Message < ApplicationRecord
  mount_uploader :image, ImageUploader
  is_impressionable

  belongs_to :user
  validates :title, presence: true

  def publish!
  self.is_hidden = false
  self.save
  end

  def hide!
  self.is_hidden = true
  self.save
  end
end
