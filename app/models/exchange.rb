class Exchange < ApplicationRecord
  mount_uploader :image, ImageUploader
  is_impressionable

  belongs_to :user
  validates :title, presence: true

  has_many :comments

  has_many :exchange_collections
  has_many :members, through: :exchange_collections, source: :user

  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end
end
