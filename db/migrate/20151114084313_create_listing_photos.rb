class CreateListingPhotos < ActiveRecord::Migration
  def change
    create_table :listing_photos do |t|
      t.string :photo
      t.integer :listing_id

      t.timestamps null: false
    end
  end
end
