class Like < ApplicationRecord
  belongs_to :user
  belongs_to :posted
  validates_uniqueness_of :posted_id, scope: :user_id
end
