# rails db:migrate:down VERSION=20180607133700
class CreateFoodCategories < ActiveRecord::Migration[5.1]
  def up
    create_table :food_categories do |t|
      t.string :ancestry
      t.string :cuisine
      t.string :name
      t.string :name_ja
      t.text :image

      t.timestamps
    end
    add_index :food_categories, :ancestry
  end

  def down
    drop_table :food_categories
  end
end
