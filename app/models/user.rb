require 'sendgrid-ruby'

class User < ApplicationRecord
  include SendGrid
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true
  validate :email_chk

  def mail_to
    data = JSON.parse('{
      "personalizations": [
        {
          "to": [
            {
              "email": "ayushp@seas.upenn.edu"
            }
          ],
          "subject": "Thanks for Signing Up!"
        }
      ],
      "from": {
        "email": "admin@datadoc.com"
      },
      "content": [
        {
          "type": "text/plain",
          "value": "Thanks for signing up to use DataDoc."
        }
      ]
    }')
    data['personalizations'][0]['to'][0]['email'] = email
    # sg = SendGrid::API.new(api_key: Rails.application.secrets.sendgrid_api_key.to_s)
    sg = SendGrid::API.new(api_key: '')
    sg.client.mail._('send').post(request_body: data)
  end

  private

  def email_chk
    return unless email && (!email.include?('@') || !email.include?('.'))
    errors.add(:email, "must have an '@' and a '.'")
  end
end
