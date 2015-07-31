class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.references :user, index: true
      t.references :circle, index: true
      t.integer :friend_num

      t.timestamps
    end
  end
end
