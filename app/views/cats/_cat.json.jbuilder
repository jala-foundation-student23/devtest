json.extract! cat, :id, :name, :image_url, :favorited, :is_adopted, :created_at, :updated_at
json.url cat_url(cat, format: :json)
