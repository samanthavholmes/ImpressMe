30.times do
  User.create!(username: Faker::Internet.user_name, password: "password", email: Faker::Internet.email)
end

40.times do
  Post.create!(body: Faker::Lorem.paragraph, caption: Faker::Lorem.sentence, user_id: Faker::Number.between(1,30))
end

40.times do
  Post.create!(image_id: Faker::Number.between(1,40), caption: Faker::Lorem.sentence, user_id: Faker::Number.between(1,30))
end

40.times do
  Image.create!(url: Faker::Avatar.image)
end

20.times do
  Comment.create!(body: Faker::Lorem.sentence, user_id:  Faker::Number.between(1,30), post_id: Faker::Number.between(1,80))
end

50.times do
  Tag.create!(body: Faker::Commerce.color)
end


25.times do
  PostTag.create!(tag_id: Faker::Number.between(1,50), post_id: Faker::Number.between(1,80))
end

15.times do
  Like.create!(post_id: Faker::Number.between(1,40), user_id: Faker::Number.between(1,30))
end
