class UserFriendshipsController < FriendshipsController
    def index
        @friendships = Friendship.friendships_for_user(params[:user_id])
    end

    def destroy
        @friendship = Friendship.find(params[:id])
        @friendship.destroy

        respond_to do |format|
            format.turbo_stream { render turbo_stream: turbo_stream.remove(@friendship) }
            format.html { redirect_to user_friendships_url }
        end
    end
end
