# The Treatment class.
class Treatment < ApplicationRecord
  has_many :patients_treatments, dependent: :destroy
  has_many :patients, through: :patients_treatments
  validates :name, presence: true
end
