class Notifier < ActionMailer::Base
  default :from => "teste@from.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.email_friend.subject
  #
  def email_friend(artigo, sender_name, receiver_email)
    @greeting = "Hi"
    @artigo = artigo
    @sender_name = sender_name

    mail :to => receiver_email, :subject => "Artigo Interessante"
  end
end




