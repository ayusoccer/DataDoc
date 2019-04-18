# The PatientsTreatments join table.
class PatientsTreatments < ApplicationRecord
  belongs_to :patient
  belongs_to :treatment
end
