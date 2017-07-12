class Offer < ApplicationRecord
  mount_uploader :image, ImageUploader
  is_impressionable

  belongs_to :user
  validates :title, presence: true

  has_many :offer_collections
  has_many :members, through: :offer_collections, source: :user

  def publish!
  self.is_hidden = false
  self.save
  end

  def hide!
  self.is_hidden = true
  self.save
  end
end
