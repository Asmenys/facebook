class UserFriendshipsController < ApplicationController
    def index
        @friendships = Friendship.friendships_for_user(params[:user_id])
    end
end
