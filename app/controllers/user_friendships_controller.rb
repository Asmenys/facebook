class UserFriendshipsController < FriendshipsController
    def index
        @friendships = User.find(params[:user_id]).friendships
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
