json.extract! user, :id, :Email, :Passwaord, :created_at, :updated_at
json.url user_url(user, format: :json)
