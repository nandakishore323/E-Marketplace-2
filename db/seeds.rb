Product.destroy_all

10.times do |num|
  Product.create!(
    title: "Title #{num}",
    user: User.first,
    subject: "Electronics",
    description: "Barhiya product hai bhai",
    price: 5
  )

  users = [
    {
        email: "nk323@wtf.com",
        password: '123456',
        password_confirmation: '123456',
        name: 'Nanda Kishore',
        preferred_name: 'Kuch Bhi',
        superadmin_role: true
    },
    {
        email: "aditya434@wtf.com",
        password: '234567',
        password_confirmation: '234567',
        name: 'Aditya',
        preferred_name: 'Bro',
        superadmin_role: true

    }
  ]

  User.create!(users)
end
