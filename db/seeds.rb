30.times do
  User.create!(username: Faker::Internet.user_name, password: "password", email: Faker::Internet.email)
end

40.times do
  Post.create!(body: Faker::Lorem.paragraph, caption: Faker::Lorem.sentence, user_id: Faker::Number.between(1,30))
end

20.times do
  Comment.create!(body: Faker::Lorem.sentence, user_id:  Faker::Number.between(1,30), post_id: Faker::Number.between(1,40))
end

15.times do
  Tag.create!(body: Faker::Commerce.color)
end

15.times do
  Like.create!(post_id: Faker::Number.between(1,40), user_id: Faker::Number.between(1,30))
end
