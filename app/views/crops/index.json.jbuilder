json.array!(@crops) do |crop|
  json.extract! crop, :id, :user_id, :crop_type_id, :description, :weight
  json.url crop_url(crop, format: :json)
end
