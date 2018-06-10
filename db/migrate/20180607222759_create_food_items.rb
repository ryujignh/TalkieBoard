# rails db:migrate:down VERSION=20180607222759

class CreateFoodItems < ActiveRecord::Migration[5.1]
  def up
    create_table :food_items do |t|
      t.string :cuisine
      t.string :food_type
      t.string :name
      t.string :name_ja
      t.string :description
      t.string :description_ja
      t.boolean :hot
      t.boolean :spicy
      t.boolean :sweet
      t.text :image

      t.timestamps
    end
    add_reference(:food_items, :category, index: true, after: :id)
  end

  def down
    drop_table :food_items
  end
end
