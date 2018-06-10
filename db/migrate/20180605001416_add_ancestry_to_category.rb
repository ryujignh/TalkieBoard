# rails db:migrate:down VERSION=20180605001416
class AddAncestryToCategory < ActiveRecord::Migration[5.1]
  def up
    add_column :categories, :ancestry, :string, after: :id
    add_index :categories, :ancestry
  end

  def down
    remove_column :categories, :ancestry, :string
    remove_index :categories, :ancestry
  end
end
