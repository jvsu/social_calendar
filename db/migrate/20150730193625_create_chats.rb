class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.text :message
      t.references :user, index: true
      t.references :event, index: true

      t.timestamps
    end
  end
end
