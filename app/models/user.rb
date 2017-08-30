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

  has_many :offers

  has_many :offer_collections
  has_many :participated_offers, through: :offer_collections, source: :offer

  def is_member_of?(offer)
    participated_offers.include?(offer)
  end

  def join_offer_collection!(offer)
    participated_offers << offer
  end

  def quit_offer_collection!(offer)
    participated_offers.delete(offer)
  end

  has_many :notices

  has_many :educations

  has_many :exchanges
  has_many :exchange_collections
  has_many :participated_exchanges, through: :exchange_collections, source: :exchange

  def is_member_of?(exchange)
    participated_exchanges.include?(exchange)
  end

  def join_exchange_collection!(exchange)
    participated_exchanges << exchange
  end

  def quit_exchange_collection!(exchange)
    participated_exchanges.delete(exchange)
  end

  has_many :industries

  has_many :lists

  has_many :works

  has_many :comments

  validates_uniqueness_of :name

  mount_uploader :avatar, ImageUploader


end
