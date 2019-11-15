class Contact < MailForm::Base

  #Validations on my form.
  attribute :name,    :validate => true
  attribute :message,    :validate => true
  attribute :nickname,    :captcha => true
  attribute :email,     :validate => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i


  def headers
    {
        :subject => "Contact Form",
        :to => "niallscanlon98@outlook.com",
        :from => %("#{name}" <#{email}>)
    }
  end
end