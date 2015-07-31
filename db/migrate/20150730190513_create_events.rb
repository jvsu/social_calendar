class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :description
      t.date :date
      t.time :time
      t.integer :join_threshold
      t.references :circle, index: true
      t.references :user, index: true
      t.references :picture, index: true
      t.boolean :invitation

      t.timestamps
    end
  end
end
