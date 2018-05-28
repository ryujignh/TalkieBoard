# rails db:migrate:down VERSION=20180528223110
class AddPositionField < ActiveRecord::Migration[5.1]

  def up
    add_column(:categories, :position, :integer, after: :name_en)
    add_column(:items, :position, :integer, after: :name_en)
  end

  def down
    remove_column(:categories, :position)
    remove_column(:items, :position)
  end

end
