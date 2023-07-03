require "faker"

5.times do
  new_user = User.create(
    username: Faker::Name.first_name, email: Faker::Internet.email
  )
  10.times do
    new_post = Post.create(
      title: Faker::Dessert.topping,
      url: Faker::Creature::Animal.name,
      votes: Faker::Number.number(digits: 3),
      user_id: new_user.id
    )
  end
end
