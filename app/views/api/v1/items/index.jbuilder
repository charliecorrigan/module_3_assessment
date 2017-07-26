json.(@items) do |item|
  json.(item, :id, :name, :description, :image_url)
end
