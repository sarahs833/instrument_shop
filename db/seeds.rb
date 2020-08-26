# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.firsts)
# sarah = User.create(name:'sarah',email:'sarah@gmail.com',password:'123456',
#                     password_confirmation:'123456',activated:true,activated_at:Time.zone.now)

# instruments = ["piano","guitar","drum","bass"]

# instruments.each do |instrument|
#   Categorie.create(name: instrument)
# end

# puts 'We have created' + Categorie.all.count.to_s + 'categories'

brands = ["yamaha","FAZIOLI","C. Bechstein","Steinway & Sons","Sauter"]

10.times do
  Categorie.first.products.create(user_id:1,brand: brands.sample, price: (2500..5800).to_a.sample )
end




