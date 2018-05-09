# rails db:migrate:down VERSION=20180508234856

class CreateItems < ActiveRecord::Migration[5.1]
  def up
    create_table :items do |t|
      t.string :name
      t.string :description
      t.string :image
      t.timestamps
    end
    add_reference(:items, :category, index: true, after: :id)
  end

  def down
    drop_table :items
  end
end
