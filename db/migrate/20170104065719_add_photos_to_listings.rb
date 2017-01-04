class AddPhotosToListings < ActiveRecord::Migration
  def change
    add_column :listings, :photo, :json
  end
end
