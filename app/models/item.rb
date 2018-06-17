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

  before_save :format_values

  TRANSLATABLE_FIELDS = {
    ja: {
      name: :name_ja,
      description: :description_ja,
    }
  }

  validates_uniqueness_of :position, scope: :category_id, allow_blank: true

  belongs_to :category, inverse_of: :items, touch: true

  include Naming
  include Image

  def localized_description
    I18n.locale == :ja ? self.description_ja : self.description
  end

  def format_values
    self.image = self.image.gsub(' ', '_').downcase
  end

end
