class FriendshipsController < ApplicationController
    def show
        @friendship = Friendship.find(params[:id])
    end

    def index
        @friendships = Friendship.all
    end
end
