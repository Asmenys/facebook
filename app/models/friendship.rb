class Friendship < ApplicationRecord
    belongs_to :friendship_master, class_name: "User"
    belongs_to :friendship_receiver, class_name: "User"
end
