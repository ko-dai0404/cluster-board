class Room < ApplicationRecord

  validates :room_name,   presence: true, length: { maximum: 118 }
  validates :category_id, numericality: { other_than: 1 }
  validates :content,     presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  has_one_attached :image

  # has_many :room_users
  # has_many :users, through: :room_users
  has_many :messages
  belongs_to :user
end
