class JungleMailer < ApplicationMailer
  default from: "no-reply@jungle.com"

  def purchase_confirmation(user)
    @user = user
    mail(to: @user.email, subject: 'Sample Email')
  end

end
