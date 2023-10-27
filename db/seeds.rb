# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Comment.all.delete_all
User.all.delete_all
CharacteristicCar.all.delete_all
Car.all.delete_all
Characteristic.all.delete_all

User.create!(email: "administrador@gmail.com", role: "administrator", password: "123456",
            password_confirmation: "123456")

User.create!(email: "client@gmail.com", role: "client", password: "123456",
            password_confirmation: "123456")

characteristics = [
  "Batería de iones de litio",
  "Batería de estado sólido",
  "Sistema de Carga alámbrica",
  "Sistema de Carga Inalámbrica",
  "Tecnología de Asistencia a la Conducción"
  ]
            
  characteristics.each do |name|
    Characteristic.find_or_create_by(name: name)
  end

20.times do |i|
  car = Car.create(
    model: "ELECTRO-#{i + 1}",
    brand: ["Tesla", "Nissan", "Chevrolet", "BMW", "Audi", "Hyundai", "Kia", "Ford", "Porsche", "Volkswagen"].sample,
    year: 2023 - i,
    autonomy: rand(200..400),
    rental_price: rand(50.0..200.0).round(2)
  )

  Comment.create(body: Faker::Lorem.sentence(word_count: 3), user: User.first, car: car)

  random_characteristics = Characteristic.all.sample(rand(1..characteristics.length))
            
  random_characteristics.each do |characteristic|
    CharacteristicCar.create(car: car, characteristic: characteristic)
  end
end

