class Room < ApplicationRecord
  has_many :room_users
  #dependent: :destroyで関連するモデルも削除
  has_many :users, through: :room_users, dependent: :destroy
  has_many :messages, dependent: :destroy
  validates :name, presence: true
end
