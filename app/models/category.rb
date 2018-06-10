# +------------+--------------+------+-----+---------+----------------+
# | Field      | Type         | Null | Key | Default | Extra          |
# +------------+--------------+------+-----+---------+----------------+
# | id         | bigint(20)   | NO   | PRI | NULL    | auto_increment |
# | ancestry   | varchar(255) | YES  | MUL | NULL    |                |
# | identifier | varchar(255) | YES  |     | NULL    |                |
# | name       | varchar(255) | YES  | MUL | NULL    |                |
# | name_ja    | varchar(255) | YES  |     | NULL    |                |
# | position   | int(11)      | YES  |     | NULL    |                |
# | image      | text         | YES  |     | NULL    |                |
# | created_at | datetime     | NO   |     | NULL    |                |
# | updated_at | datetime     | NO   |     | NULL    |                |
# +------------+--------------+------+-----+---------+----------------+

class Category < ApplicationRecord
  before_save :format_values

  has_many :items, inverse_of: :category
  has_ancestry

  validates :position, uniqueness: true

  include Naming
  include Image

  def to_param
    self.identifier
  end

  def format_values
    return if self.identifier.blank?
    self.identifier = self.identifier.downcase.gsub(' ', '_')
  end

end
