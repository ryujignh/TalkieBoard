# +----------------+--------------+------+-----+---------+----------------+
# | Field          | Type         | Null | Key | Default | Extra          |
# +----------------+--------------+------+-----+---------+----------------+
# | id             | bigint(20)   | NO   | PRI | NULL    | auto_increment |
# | category_id    | bigint(20)   | YES  | MUL | NULL    |                |
# | name           | varchar(255) | YES  |     | NULL    |                |
# | name_en        | varchar(255) | YES  |     | NULL    |                |
# | description    | varchar(255) | YES  |     | NULL    |                |
# | description_en | varchar(255) | YES  |     | NULL    |                |
# | image          | text         | YES  |     | NULL    |                |
# | created_at     | datetime     | NO   |     | NULL    |                |
# | updated_at     | datetime     | NO   |     | NULL    |                |
# +----------------+--------------+------+-----+---------+----------------+

class Item < ApplicationRecord

  belongs_to :category

end
