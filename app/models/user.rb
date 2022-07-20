class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, foreign_key: "creator"

  has_many :sent_friendships, class_name: "Friendship", inverse_of: "friendship_master", foreign_key: "friendship_master_id"
  has_many :received_friendships, class_name: "Friendship", inverse_of: "friendship_receiver", foreign_key: "friendship_receiver_id"
end
