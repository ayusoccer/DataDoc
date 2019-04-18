json.extract! patient, :id, :last_name, :first_name, :email, :insurance, :created_at, :updated_at
json.url patient_url(patient, format: :json)
