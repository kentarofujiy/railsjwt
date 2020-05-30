json.extract! product, :id, :name, :description, :price
json.picture url_for(product.picture) if product.picture.attached?
