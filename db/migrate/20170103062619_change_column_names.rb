class ChangeColumnNames < ActiveRecord::Migration
  def change
  	rename_column :listings, :users_id, :user_id
  	change_column_default(:listings, :status, 'available')
  end
end
