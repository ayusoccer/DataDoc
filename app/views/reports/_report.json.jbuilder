json.extract! report, :id, :date, :notes, :report_num, :created_at, :updated_at
json.url report_url(report, format: :json)
