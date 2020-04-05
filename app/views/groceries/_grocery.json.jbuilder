json.extract! grocery,  :id, :name, :user_id, :created_at, :updated_at
json.image url_for(grocery.image) if grocery.image.attached?
json.url grocery_url(grocery, format: :json)
