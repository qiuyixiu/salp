class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    is_admin
  end

  has_many :introductions
  has_many :games
  has_many :messages
  has_many :notices

  validates_uniqueness_of :name

  mount_uploader :avatar, ImageUploader
end
