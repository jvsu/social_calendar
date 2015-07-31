class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.references :user, index: true
      t.references :event, index: true
      t.boolean :checkin

      t.timestamps
    end
  end
end
