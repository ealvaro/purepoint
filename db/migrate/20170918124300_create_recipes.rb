class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :href
      t.string :ingredients
      t.string :thumbnail

      t.timestamps
    end
  end
end
