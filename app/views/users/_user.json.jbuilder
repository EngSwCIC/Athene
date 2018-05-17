json.extract! user, :id, :nick, :senha, :email, :created_at, :updated_at
json.url user_url(user, format: :json)
