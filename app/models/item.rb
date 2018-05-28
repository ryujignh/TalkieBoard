# +----------------+--------------+------+-----+---------+----------------+
# | Field          | Type         | Null | Key | Default | Extra          |
# +----------------+--------------+------+-----+---------+----------------+
# | id             | bigint(20)   | NO   | PRI | NULL    | auto_increment |
# | category_id    | bigint(20)   | YES  | MUL | NULL    |                |
# | name           | varchar(255) | YES  |     | NULL    |                |
# | name_en        | varchar(255) | YES  |     | NULL    |                |
# | position       | int(11)      | YES  |     | NULL    |                |
# | description    | varchar(255) | YES  |     | NULL    |                |
# | description_en | varchar(255) | YES  |     | NULL    |                |
# | image          | text         | YES  |     | NULL    |                |
# | created_at     | datetime     | NO   |     | NULL    |                |
# | updated_at     | datetime     | NO   |     | NULL    |                |
# +----------------+--------------+------+-----+---------+----------------+

class Item < ApplicationRecord

  validates_uniqueness_of :position, scope: :category_id

  belongs_to :category, touch: true

  def localized_name
    I18n.locale == :ja ? self.name : self.name_en
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
