class CreateCharacterInPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :character_in_photos do |t|
      t.references :character, foreign_key: true
      t.references :photo, foreign_key: true
      t.integer :start_x
      t.integer :end_x
      t.integer :start_y
      t.integer :end_y

      t.timestamps
    end
  end
end
