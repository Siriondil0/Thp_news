# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  user = User.create!(name: Faker::Dune.character)
end
10.times do
  use = User.offset(rand(User.count)).first
  li = Link.create!(url: Faker::Internet.url, user: use)
end

i=0
50.times do
  if i==0
    use = User.offset(rand(User.count)).first
    li = Link.offset(rand(Link.count)).first
    comment = li.comments.create!(body: Faker::HitchhikersGuideToTheGalaxy.quote, user: use)
    i+=1
  else
    i=rand(1..2)
    if i ==1
      use = User.offset(rand(User.count)).first
      li = Link.offset(rand(Link.count)).first
      comment = li.comments.create!(body: Faker::HitchhikersGuideToTheGalaxy.quote, user: use)
    else
      use = User.offset(rand(User.count)).first
      com = Comment.offset(rand(Comment.count)).first
      comment = com.comments.create!(body: Faker::HitchhikersGuideToTheGalaxy.quote, user: use)
    end
  end
end
