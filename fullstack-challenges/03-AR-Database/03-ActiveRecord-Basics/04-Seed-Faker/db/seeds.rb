require "faker"
# TODO: Write a seed to insert 100 posts in the database

100.times do
  Post.create(
    title: Faker::Creature::Animal.name, url: Faker::Sports::Football.player, votes: Faker::Number.number(digits: 3)
  )
end
