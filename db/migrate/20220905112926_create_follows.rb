class CreateFollows < ActiveRecord::Migration[7.0]
  def change
    create_table :follows do |t|
      t.integer   :follower_user_id, null: false
      t.integer   :followed_user_id, null: false

      t.timestamps
    end
    add_index :follows, [:follower_user_id, :followed_user_id], unique: true
  end
end
