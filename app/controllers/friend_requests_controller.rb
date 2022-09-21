class FriendRequestsController < ApplicationController
    def new
        @friend_request = FriendRequest.new
    end

    def create
        @friend_request = FriendRequest.new(friend_request_params)

        if @friend_request.save

        end
    end


    private

    def friend_request_params
        params.require(:friend_request).permit(:request_sender_id, :request_receiver_id)
    end
end
