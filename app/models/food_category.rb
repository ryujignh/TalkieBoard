# +------------+--------------+------+-----+---------+----------------+
# | Field      | Type         | Null | Key | Default | Extra          |
# +------------+--------------+------+-----+---------+----------------+
# | id         | bigint(20)   | NO   | PRI | NULL    | auto_increment |
# | ancestry   | varchar(255) | YES  | MUL | NULL    |                |
# | cuisine    | varchar(255) | YES  |     | NULL    |                |
# | name       | varchar(255) | YES  |     | NULL    |                |
# | name_ja    | varchar(255) | YES  |     | NULL    |                |
# | image      | text         | YES  |     | NULL    |                |
# | created_at | datetime     | NO   |     | NULL    |                |
# | updated_at | datetime     | NO   |     | NULL    |                |
# +------------+--------------+------+-----+---------+----------------+

class FoodCategory < ApplicationRecord
  has_many :items, inverse_of: :category, class_name: 'FoodItem', foreign_key: :category_id
  has_ancestry

  include Naming
  include Image

  def to_param
    :name
  end

end
