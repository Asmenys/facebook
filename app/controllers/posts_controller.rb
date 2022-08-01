class PostsController < ApplicationController
    before_action :authenticate_user!, only: [:edit, :destroy, :new, :create, :update]
    def index
        @posts = Post.all
    end

    def new
        @post = Post.new
    end

    def create 
        @post = current_user.posts.new(post_params)
        if @post.save
            redirect_to post_path(@post)
        else
            render 'new', status: :unprocessable_entity
        end
    end

    def show
       @post = Post.find(params[:id]) 
    end

    private

    def post_params
        params.require(:post).permit(:body)
    end
end
