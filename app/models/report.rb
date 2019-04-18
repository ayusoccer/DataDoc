# The Report class.
class Report < ApplicationRecord
  belongs_to :patient
  validates :report_num, presence: true
end
