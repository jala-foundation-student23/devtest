class CreateCats < ActiveRecord::Migration[7.0]
  def change
    create_table :cats do |t|
      t.string :name
      t.string :image_url
      t.boolean :favorited
      t.boolean :is_adopted

      t.timestamps
    end
  end
end
