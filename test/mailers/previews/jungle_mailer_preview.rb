class JungleMailerPreview < ActionMailer::Preview
  def purchase_confirmation_preview
    ExampleMailer.purchase_confirmation(User.first)
  end
end