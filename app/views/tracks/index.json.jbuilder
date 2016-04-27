json.array!(@tracks) do |track|
  json.extract! track, :id, :name, :path, :id_album
  json.url track_url(track, format: :json)
end
