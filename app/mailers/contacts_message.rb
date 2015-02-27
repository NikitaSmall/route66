class ContactsMessage < ActionMailer::Base
  default from: "Androme photosite <nikitasosnov92@gmail.com>"
  default to: "window@i.ua"


  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contacts_message.message.subject
  #
  def send_a_mail(name, title, body)
    @name = name
    @body = body
    @title = title

    #mail to: "window@i.ua"
    mail subject: "Сообщение от сайта Никиты с темой #{@title}"
  end
end
