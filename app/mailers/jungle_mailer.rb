class JungleMailer < ApplicationMailer
  default from: "no-reply@jungle.com"

  def purchase_confirmation(order)
    @order = order
    mail(to: @order.email, subject: 'JungleMailer')
  end

end
