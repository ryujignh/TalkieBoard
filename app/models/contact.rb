class Contact < MailForm::Base

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  attribute :name, validate: true
  attribute :email, validate: VALID_EMAIL_REGEX
  attribute :message, validate: true
  # Hidden field(Prevent spam by checking if nickname present.)
  attribute :nickname, captcha: true

  def headers
    {
      subject: "Contact Form",
      to: "admin@talkie_board.com",
      from: %("#{name}" <#{email}>)
    }
  end

end