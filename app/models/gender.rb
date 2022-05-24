class Gender < ActiveHash::Base
  self.data = [
    { id: 1, gender: '--' },
    { id: 2, gender: '男性' },
    { id: 3, gender: '女性' },
    { id: 4, gender: '秘密' }
  ]

  include ActiveHash::Associations
  has_many :users
  end