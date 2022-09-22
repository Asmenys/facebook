class Friendship < ApplicationRecord
    belongs_to :friendship_master, class_name: "User"
    belongs_to :friendship_receiver, class_name: "User"

    def friend(user_id)
        if user_id == self.friendship_master_id
            self.friendship_receiver
        else
            self.friendship_master
        end
    end
end
