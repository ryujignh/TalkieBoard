# rails db:migrate:down VERSION=20180610043355

class AddIdentifierToCategories < ActiveRecord::Migration[5.1]
  def up
    add_column(:categories, :identifier, :string, after: :ancestry)
  end

  def down
    remove_column(:categories, :identifier)
  end
end
