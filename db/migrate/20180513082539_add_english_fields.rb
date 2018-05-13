# rails db:migrate:down VERSION=20180513082539

class AddEnglishFields < ActiveRecord::Migration[5.1]
  def up
    add_column :categories, :name_en, :string, after: :name

    change_table(:items, bulk: true) do |t|
      t.string :name_en, after: :name
      t.string :description_en, after: :description
    end

  end

  def down
    remove_column :categories, :name_en

    change_table(:items, bulk: true) do |t|
      t.remove :name_en
      t.remove :description_en
    end
  end
end
