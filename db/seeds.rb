# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
<<<<<<< HEAD
Product.destroy_all

10.times do |num|
  Product.create!(
    title: "Title #{num}",
    user: User.first,
    subject: "Electronics",
    description: "Barhiya product hai bhai"
  )
end
=======

>>>>>>> 5d3601944a7f3867ff06dd5cb27d2841d4456232
