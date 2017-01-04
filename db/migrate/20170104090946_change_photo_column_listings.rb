class ChangePhotoColumnListings < ActiveRecord::Migration
  def change
  	rename_column :listings, :photo, :photos
  end
end
