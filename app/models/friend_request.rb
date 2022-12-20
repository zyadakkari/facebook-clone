class FriendRequest < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  validate :not_self

  def accept
    friendship = user.friendships.build(:friend_id => friend.id)
    destroy
    friendship.save
    redirect_to 'friends/index'
  end

  private

  def not_self
    errors.add(:friend, "can't be equal to user") if user == friend
  end
end
