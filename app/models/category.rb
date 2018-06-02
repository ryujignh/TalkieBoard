# +------------+--------------+------+-----+---------+----------------+
# | Field      | Type         | Null | Key | Default | Extra          |
# +------------+--------------+------+-----+---------+----------------+
# | id         | bigint(20)   | NO   | PRI | NULL    | auto_increment |
# | name       | varchar(255) | YES  | MUL | NULL    |                |
# | name_ja    | varchar(255) | YES  |     | NULL    |                |
# | position   | int(11)      | YES  |     | NULL    |                |
# | image      | text         | YES  |     | NULL    |                |
# | created_at | datetime     | NO   |     | NULL    |                |
# | updated_at | datetime     | NO   |     | NULL    |                |
# +------------+--------------+------+-----+---------+----------------+

class Category < ApplicationRecord

  validates :position, uniqueness: true

  has_many :items

  def localized_name
    I18n.locale == :ja ? self.name : self.name_ja
  end

  def display_image
    if !self.image.blank? && FileTest.exist?("app/assets/images/#{self.image}")
      file_path = self.image
    else
      file_path = 'shared/no_image.svg'
    end
    file_path
  end

end
