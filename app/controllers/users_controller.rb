class UsersController < ApplicationController
    def show
        @user = nil
        if params.key?(:id)
            @user = User.find(params[:id])
        elsif user_signed_in?
            @user = current_user
        else
            redirect_to new_user_session_url
        end
    end
end
