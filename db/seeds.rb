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
    user_id: User.all.sample.id
    # total_points: (-5..2000).rand
    )
end

# create Answers
20.times do
  Answer.create!(
    content: Faker::StarWars.quote,
    user_id: User.all.sample.id,
    question_id: Question.all.sample.id
    )
end

# create Votes
200.times do
  Vote.create!(
    user_id: User.all.sample.id,
    value: [1, -1].sample,
    votable_type: ["Comment", "Answer", "Question"].sample,
    votable_id: (1..10)
  )
end

##
