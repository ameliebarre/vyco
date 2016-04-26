json.array!(@users) do |user|
  json.extract! user, :id, :name, :firstname, :pseudo, :password, :mail
  json.url user_url(user, format: :json)
end
