# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#stocks = StockStatus.create([{name: 1},{name: 0}])
category = Category.create([{name: "Solid colors"},{name:"Neon Pink"},{name:"Mini mochilas"}]) 
administrador = User.create([{email: "administrador@gmail.com", name: "Brandon", role: 53 }])
