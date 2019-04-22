require 'sendgrid-ruby'
include SendGrid

class User < ApplicationRecord
  has_secure_password

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
    sg = SendGrid::API.new(api_key: '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')
    response = sg.client.mail._("send").post(request_body: data)
  end
end
