# The Billingstatment class.
class Billingstatement < ApplicationRecord
  belongs_to :patient
  validates :statement_num, presence: true
end
