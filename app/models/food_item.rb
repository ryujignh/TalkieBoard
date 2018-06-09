# +----------------+--------------+------+-----+---------+----------------+
# | Field          | Type         | Null | Key | Default | Extra          |
# +----------------+--------------+------+-----+---------+----------------+
# | id             | bigint(20)   | NO   | PRI | NULL    | auto_increment |
# | category_id    | bigint(20)   | YES  | MUL | NULL    |                |
# | cuisine        | varchar(255) | YES  |     | NULL    |                |
# | food_type      | varchar(255) | YES  |     | NULL    |                |
# | name           | varchar(255) | YES  |     | NULL    |                |
# | name_ja        | varchar(255) | YES  |     | NULL    |                |
# | description    | varchar(255) | YES  |     | NULL    |                |
# | description_ja | varchar(255) | YES  |     | NULL    |                |
# | hot            | tinyint(1)   | YES  |     | NULL    |                |
# | spicy          | tinyint(1)   | YES  |     | NULL    |                |
# | sweet          | tinyint(1)   | YES  |     | NULL    |                |
# | image          | text         | YES  |     | NULL    |                |
# | created_at     | datetime     | NO   |     | NULL    |                |
# | updated_at     | datetime     | NO   |     | NULL    |                |
# +----------------+--------------+------+-----+---------+----------------+

class FoodItem < ApplicationRecord
  before_save :inherit_cuisine
  before_save :format_values

  belongs_to :category, class_name: 'FoodCategory',
             foreign_key: :category_id, inverse_of: :items,
             optional: true

  include Naming
  include Image

  scope :cuisine, lambda { |cuisine| where('cuisine = ?', cuisine.downcase) }

  private

  def inherit_cuisine
    return if self.cuisine.present?
    self.cuisine = self.category.cuisine
  end

  def format_values
    self.cuisine = self.cuisine.try(:downcase)
  end

end
