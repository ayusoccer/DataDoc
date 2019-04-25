class AddPatientToReports < ActiveRecord::Migration[5.1]
  def change
    add_reference :reports, :patient, foreign_key: true
  end
end
