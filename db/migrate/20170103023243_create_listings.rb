class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :title
      t.belongs_to :users
      t.text :address
      t.string :status
      t.integer :price
      t.string :type

      t.timestamps null: false
    end
  end
end
