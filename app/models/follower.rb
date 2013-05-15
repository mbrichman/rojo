class Follower < ActiveRecord::Base
  attr_accessible :follower_id, :user_id
  belongs_to      :user
  belongs_to      :follower, class_name: 'User'

  validates :user_id, :follower_id, presence: true
  validates :user_id, uniqueness: { scope: :follower_id, message: "is already following that user."
}
end
