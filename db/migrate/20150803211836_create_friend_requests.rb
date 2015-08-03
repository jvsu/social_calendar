class CreateFriendRequests < ActiveRecord::Migration
  def change
    create_table :friend_requests do |t|
      t.references :user, index: true
      t.integer :friend_id
      t.boolean :pending

      t.timestamps
    end
  end
end
