class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :image,        presence: true
  validates :nickname,     presence: true, length: { maximum: 10 }
  validates :gender_id,    numericality: { other_than: 1 }
  validates :introduction, presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :gender
  has_one_attached :image
end
