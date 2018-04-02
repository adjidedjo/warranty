json.extract! registration, :id, :code, :name, :address, :created_at, :updated_at
json.url registration_url(registration, format: :json)
