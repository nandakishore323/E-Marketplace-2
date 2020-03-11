Product.destroy_all

10.times do |num|
  Product.create!(
    title: "Title #{num}",
    user: User.first,
    subject: "Electronics",
    description: "Barhiya product hai bhai",
    price: 5
  )
end
