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
            respond_to do |format|
                format.html { redirect_to posts_path }
                format.turbo_stream
            end
        else
            render 'new', status: :unprocessable_entity
        end
    end

    def show
       @post = Post.find(params[:id]) 
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        
        respond_to do |format|
            format.turbo_stream { render turbo_stream: turbo_stream.remove(@post) }
            format.html { redirect_to posts_url }
        end
    end

    private

    def post_params
        params.require(:post).permit(:body)
    end
end
