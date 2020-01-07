json.extract! user, :id, :name, :email, :dob, :role, :description, :city_id, :created_at, :updated_at
json.url user_url(user, format: :json)
