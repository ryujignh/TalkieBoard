# rails db:migrate:down VERSION=20180602031347
class AlterEnglishFields < ActiveRecord::Migration[5.1]
  def up
    change_table(:items, bulk: true) do |t|
      t.rename :name_en, :name_ja
      t.rename :description_en, :description_ja
    end
    rename_column(:categories, :name_en, :name_ja)
  end

  def down
    change_table(:items, bulk: true) do |t|
      t.rename :name_ja, :name_en
      t.rename :description_ja, :description_en
    end
    rename_column(:categories, :name_ja, :name_en)
  end
end
