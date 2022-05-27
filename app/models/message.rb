class Message < ApplicationRecord
  validates :message, presence: true

  belongs_to :room
  belongs_to :user
  has_one_attached :image
end
