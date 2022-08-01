class Post < ApplicationRecord
    belongs_to :creator, class_name: "User"
    
    has_many :comments, as: :commentable

    has_many :likes, as: :likeable

    validates :body, presence: true
    validates :body, length: {minimum: 10}
end
