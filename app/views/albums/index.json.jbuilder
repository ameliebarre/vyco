json.array!(@albums) do |album|
  json.extract! album, :id, :name, :date_release, :style, :id_artist
  json.url album_url(album, format: :json)
end
