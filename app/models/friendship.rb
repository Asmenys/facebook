class Friendship < ApplicationRecord
    belongs_to :friendship_master, class_name: "User"
    belongs_to :friendship_receiver, class_name: "User"

    scope :friendships_for_user, ->(user_id) {self.where(:friendship_receiver_id == user_id).or(self.where(:friendship_master_id == user_id))}
end
