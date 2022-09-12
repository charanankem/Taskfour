class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable


    #associations
    #followers
    has_many :received_follows, foreign_key: :followed_user_id, class_name: "Follow"
    has_many :followers, through: :received_follows
    #following
    has_many :given_follows, foreign_key: :follower_user_id, class_name: "Follow"
    has_many :followings, through: :given_follows

    has_many :posts

    has_one_attached:profile_picture
end
