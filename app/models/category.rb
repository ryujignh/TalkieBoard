# +------------+--------------+------+-----+---------+----------------+
# | Field      | Type         | Null | Key | Default | Extra          |
# +------------+--------------+------+-----+---------+----------------+
# | id         | bigint(20)   | NO   | PRI | NULL    | auto_increment |
# | ancestry   | varchar(255) | YES  | MUL | NULL    |                |
# | name       | varchar(255) | YES  | MUL | NULL    |                |
# | name_ja    | varchar(255) | YES  |     | NULL    |                |
# | position   | int(11)      | YES  |     | NULL    |                |
# | image      | text         | YES  |     | NULL    |                |
# | created_at | datetime     | NO   |     | NULL    |                |
# | updated_at | datetime     | NO   |     | NULL    |                |
# +------------+--------------+------+-----+---------+----------------+

class Category < ApplicationRecord

  has_many :items, inverse_of: :category
  has_ancestry

  validates :position, uniqueness: true

  include Naming
  include Image

end
