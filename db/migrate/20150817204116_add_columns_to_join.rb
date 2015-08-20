class AddColumnsToJoin < ActiveRecord::Migration
  def change
  	add_column :joins, :invitation, :boolean
  	add_column :joins, :checkin, :boolean
  	add_column :joins, :confirm, :boolean
  end
end
