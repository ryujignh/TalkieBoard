# +------------------------+--------------+------+-----+---------+----------------+
# | Field                  | Type         | Null | Key | Default | Extra          |
# +------------------------+--------------+------+-----+---------+----------------+
# | id                     | bigint(20)   | NO   | PRI | NULL    | auto_increment |
# | email                  | varchar(255) | NO   | UNI |         |                |
# | admin                  | tinyint(1)   | NO   |     | 0       |                |
# | encrypted_password     | varchar(255) | NO   |     |         |                |
# | reset_password_token   | varchar(255) | YES  | UNI | NULL    |                |
# | reset_password_sent_at | datetime     | YES  |     | NULL    |                |
# | remember_created_at    | datetime     | YES  |     | NULL    |                |
# | sign_in_count          | int(11)      | NO   |     | 0       |                |
# | current_sign_in_at     | datetime     | YES  |     | NULL    |                |
# | last_sign_in_at        | datetime     | YES  |     | NULL    |                |
# | current_sign_in_ip     | varchar(255) | YES  |     | NULL    |                |
# | last_sign_in_ip        | varchar(255) | YES  |     | NULL    |                |
# | created_at             | datetime     | NO   |     | NULL    |                |
# | updated_at             | datetime     | NO   |     | NULL    |                |
# +------------------------+--------------+------+-----+---------+----------------+

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
