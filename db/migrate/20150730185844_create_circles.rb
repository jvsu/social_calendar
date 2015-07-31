class CreateCircles < ActiveRecord::Migration
  def change
    create_table :circles do |t|
      t.string :name
      t.references :user, index: true

      t.timestamps
    end
  end
end
