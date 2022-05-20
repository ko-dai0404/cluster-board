class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,     presence: true
  validates :gender_id,    numericality: { other_than: 1 }
  validates :introduction, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :gender
  has_one_attached :image
end
