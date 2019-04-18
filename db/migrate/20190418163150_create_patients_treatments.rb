class CreatePatientsTreatments < ActiveRecord::Migration[5.1]
  def change
    create_table :patients_treatments do |t|
      t.references :patient, foreign_key: true
      t.references :treatment, foreign_key: true
    end
  end
end
