# rails db:migrate:down VERSION=20180508234254

class CreateCategories < ActiveRecord::Migration[5.1]
  def up
    create_table :categories, bulk: true do |t|
      t.string :name
      t.timestamps
    end
    add_index :categories, :name
  end

  def down
    drop_table :categories
  end
end
