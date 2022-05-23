class Category < ActiveHash::Base
  self.data = [
    { id: 1, category: '--' },
    { id: 2, category: '友達募集！' },
    { id: 3, category: '一緒に勉強しませんか？' },
    { id: 4, category: '男性限定！' },
    { id: 5, category: '女性限定！' },
    { id: 6, category: 'ボイスチャットしましょう！' },
    { id: 7, category: 'チャットのみでもOK' },
    { id: 8, category: '無言OK' },
    { id: 9, category: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :rooms
  end