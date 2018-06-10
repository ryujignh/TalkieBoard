module Image
  extend ActiveSupport::Concern

  def display_image
    if !self.image.blank? && FileTest.exist?("app/assets/images/#{self.image}")
      file_path = self.image
    else
      file_path = 'shared/no_image.svg'
    end
    file_path
  end

end
