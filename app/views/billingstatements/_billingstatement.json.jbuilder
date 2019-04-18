json.extract! billingstatement, :id, :date, :description, :total, :statement_num, :created_at, :updated_at
json.url billingstatement_url(billingstatement, format: :json)
