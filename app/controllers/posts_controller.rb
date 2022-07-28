class PostsController < ApplicationController
    before_action :authenticate_user!, only: [:edit, :destroy, :new, :create, :update]
    def index
        @posts = Post.all
    end
end
