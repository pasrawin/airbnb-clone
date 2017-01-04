class AddCityColumns < ActiveRecord::Migration
  def change
  	add_column :listings, :city, :string
  	add_column :listings, :country, :string
  end
end
