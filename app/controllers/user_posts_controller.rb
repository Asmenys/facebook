class UserPostsController < PostsController
    def index
        @posts = Post.all.where(creator_id: params[:user_id])
    end
end
