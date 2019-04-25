# The Billingstatment class.
class Billingstatement < ApplicationRecord
  belongs_to :patient
  validates :statement_num, presence: true, uniqueness: true
  validates :total, presence: true
  validates :description, presence: true
  validates :date, presence: true
end
