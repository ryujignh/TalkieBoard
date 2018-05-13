# +------------+--------------+------+-----+---------+----------------+
# | Field      | Type         | Null | Key | Default | Extra          |
# +------------+--------------+------+-----+---------+----------------+
# | id         | bigint(20)   | NO   | PRI | NULL    | auto_increment |
# | name       | varchar(255) | YES  | MUL | NULL    |                |
# | name_en    | varchar(255) | YES  |     | NULL    |                |
# | image      | text         | YES  |     | NULL    |                |
# | created_at | datetime     | NO   |     | NULL    |                |
# | updated_at | datetime     | NO   |     | NULL    |                |
# +------------+--------------+------+-----+---------+----------------+

class Category < ApplicationRecord

  has_many :items

  def localized_name
    I18n.locale == :ja ? self.name : self.name_en
  end

end
