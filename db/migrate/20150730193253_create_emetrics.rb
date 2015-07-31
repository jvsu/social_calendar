class CreateEmetrics < ActiveRecord::Migration
  def change
    create_table :emetrics do |t|
      t.references :event, index: true
      t.integer :save_num
      t.integer :join_num
      t.integer :like_num

      t.timestamps
    end
  end
end
