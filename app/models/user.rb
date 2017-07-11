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

  has_many :message_collections
  has_many :participated_messages, through: :message_collections, source: :message

  def is_member_of?(message)
    participated_messages.include?(message)
  end

  def join_message_collection!(message)
    participated_messages << message
  end

  def quit_message_collection!(message)
    participated_messages.delete(message)
  end

  has_many :notices

  validates_uniqueness_of :name

  mount_uploader :avatar, ImageUploader


end
