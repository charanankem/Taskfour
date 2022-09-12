class Follow < ApplicationRecord
    #associations
    belongs_to :follower, foreign_key: :follower_user_id, class_name: "User"
    belongs_to :following, foreign_key: :followed_user_id, class_name: "User"


    validates :follower_user_id, uniqueness: { scope: :followed_user_id }
end
 