json.extract! car, :id, :model, :brand, :year, :autonomy, :rental_price, :created_at, :updated_at
json.url car_url(car, format: :json)
