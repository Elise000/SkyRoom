class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :listing_name
      t.string :home_type
      t.integer :accomodates
      t.integer :no_of_rooms
      t.string :smoking
      t.string :price
      t.string :description
      t.string :street_address
      t.string :country
      t.string :city
      t.string :state

      t.timestamps null: false
    end
  end
end
