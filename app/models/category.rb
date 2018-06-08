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

  def localized_name
    I18n.locale == :ja ? self.name_ja : self.name
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
