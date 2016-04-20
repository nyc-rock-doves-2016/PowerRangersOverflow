require 'faker'

user1 = User.create!(full_name: "Jason Allen", password: "123", email: "a@b.com")

# create Users
19.times do
  User.create!(
    full_name: Faker::Name.name,
    password: Faker::Internet.password,
    email: Faker::Internet.email)
end

# create Questions
20.times do
  Question.create!(
    title: Faker::Hipster.sentence(4),
    content: Faker::Hipster.paragraph(2),
    user_id: (1..100).rand
    # total_points: (-5..2000).rand
    )
end

# create Answers
20.times do
  Answer.create!(
    content: Faker::StarWars.quote
    )
end

# create Votes
# 200.times do
#   Votes.create!(
#     user_id: (1..20).rand,
#     value: [1, -1].sample,
#     votable_type: ["comments", "answers", "questions"].sample,
#     votable_id: (1..10)
#   )
# end