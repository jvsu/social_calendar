class AddConfirmedToFriend < ActiveRecord::Migration
  def change
  	add_column :friends, :confirmed,:boolean
  end
end
