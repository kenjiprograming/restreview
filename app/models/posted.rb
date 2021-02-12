class Posted < ApplicationRecord
  has_many_attached :images
  belongs_to :user

  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user, dependent: :destroy
end
