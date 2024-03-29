class UserPostsController < PostsController
    def index
        @posts = Post.all.where(creator_id: params[:user_id]).order(created_at: :desc)
    end

    def show
        @post = Post.find(params[:id]) 
    end

    def new
        @user = User.find(params[:user_id])
        @post = @user.posts.new
    end
end
