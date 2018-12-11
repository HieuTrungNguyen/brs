User.create! username: "Hieu Trung Nguyen",
             email: "nguyentrunghieu3103@gmail.com",
             password: "123456",
             avatar: "",
             password_confirmation: "123456",
             role: 1,
             admin: true
49.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@gmail.com"
  password = "123456"
  User.create! username: name,
               email: email,
               avatar: "",
               password: password,
               password_confirmation: password,
               role: 0
end

10.times do |n|
  title = Faker::Lorem.sentence 2
  description = Faker::Lorem.sentence 10
  Category.create! title: title, description: description
end

categories = Category.take 6
20.times do
  name = Faker::Lorem.sentence 3
  description = Faker::Lorem.sentence 50
  image = "https://softcover.s3.amazonaws.com/636/ruby_on_rails_tutorial_4th_edition/images/cover-web.png"
  publish_date = Faker::Date.forward 23
  price = Faker::Commerce.price
  categories.each {|category| category.books.create! name: name, description: description, image: image, publish_date: publish_date, price: price}
end
