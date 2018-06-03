# +----------------+--------------+------+-----+---------+----------------+
# | Field          | Type         | Null | Key | Default | Extra          |
# +----------------+--------------+------+-----+---------+----------------+
# | id             | bigint(20)   | NO   | PRI | NULL    | auto_increment |
# | category_id    | bigint(20)   | YES  | MUL | NULL    |                |
# | name           | varchar(255) | YES  |     | NULL    |                |
# | name_ja        | varchar(255) | YES  |     | NULL    |                |
# | position       | int(11)      | YES  |     | NULL    |                |
# | description    | varchar(255) | YES  |     | NULL    |                |
# | description_ja | varchar(255) | YES  |     | NULL    |                |
# | image          | text         | YES  |     | NULL    |                |
# | created_at     | datetime     | NO   |     | NULL    |                |
# | updated_at     | datetime     | NO   |     | NULL    |                |
# +----------------+--------------+------+-----+---------+----------------+

class Item < ApplicationRecord

  TRANSLATABLE_FIELDS = {
    ja: {
      name: :name_ja,
      description: :description_ja,
    }
  }

  validates_uniqueness_of :position, scope: :category_id

  belongs_to :category, touch: true

  def localized_name
    I18n.locale == :ja ? self.name_ja : self.name
  end

  def localized_description
    I18n.locale == :ja ? self.description_ja : self.description
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
