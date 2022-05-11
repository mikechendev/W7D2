class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.belongs_to :band, foreign_key: true, null: false
      t.string :title, null: false
      t.integer :year, null: false
      t.boolean :live, default: false, null: false

      t.timestamps
    end
  end
end
