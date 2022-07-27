class PostLike < ApplicationRecord
    belongs_to :post
    belongs_to :liker, class_name: 'User'
end
