class FundingFormMailer < ApplicationMailer
  self.delivery_job = EmailDeliveryJob

  def confirmation_email(email_address)
    @form = params[:form]
    @reference_number = params[:reference_number]
    mail(to: email_address, subject: "You’ve registered as an organisation getting EU funding")
  end

  def department_email(email_address)
    @form = params[:form]
    @reference_number = params[:reference_number]
    @address = [
      @form["address_line_1"].presence,
      @form["address_line_2"].presence,
      @form["address_town"].presence,
      @form["address_county"].presence,
    ].compact.join(", ")
    mail(to: email_address, subject: "Registration as a recipient of EU funding")
  end
end