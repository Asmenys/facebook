class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, foreign_key: "creator"

  has_many :sent_friendships, class_name: "Friendship", inverse_of: "friendship_master", foreign_key: "friendship_master_id"
  has_many :received_friendships, class_name: "Friendship", inverse_of: "friendship_receiver", foreign_key: "friendship_receiver_id"

  has_many :sent_friend_requests, class_name: "FriendRequest", inverse_of: "request_sender", foreign_key: "request_sender_id"
  has_many :received_friend_requests, class_name: "FriendRequest", inverse_of: "request_receiver", foreign_key: "request_receiver_id"

  has_many :comments, foreign_key: "creator_id"
  
  has_many :liked_posts, class_name: "PostLike", inverse_of: "liker", foreign_key: "liker_id"

  def friends
    friend_user_array = []
    friendship_list = Friendship.friendships_for_user(self.id)
    friend_user_array += friendship_list.select(:friendship_master_id).where.not(friendship_master: self).map(&:friendship_master)
    friend_user_array += friendship_list.select(:friendship_receiver_id).where.not(friendship_receiver: self).map(&:friendship_receiver)
    friend_user_array
  end
end
