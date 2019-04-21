# The PatientsTreatments join table.
class PatientsTreatment < ApplicationRecord
  belongs_to :patient
  belongs_to :treatment
  validates :treatment, uniqueness: { scope: :patient }
end
