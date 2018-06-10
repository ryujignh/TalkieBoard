module Naming
  extend ActiveSupport::Concern

  def localized_name
    I18n.locale == :ja ? self.name_ja : self.name
  end

end
