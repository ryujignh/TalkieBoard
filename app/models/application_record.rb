class ApplicationRecord < ActiveRecord::Base
  include I18nSupplementalHelper
  extend I18nSupplementalHelper
  self.abstract_class = true
end
