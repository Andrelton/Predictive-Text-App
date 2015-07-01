User.create(
  username: "daniela",
  password: "dbc",
  first_name: "Daniela"
)

10.times do |num|
  first_name = Faker::Name.name.split[0]
  User.create(
    username: "#{first_name}#{num}",
    password: "dbc",
    first_name: first_name
  )
end

Doc.create(
  title: "Fish",
  content: "I REALLY love fish! So much! ...and friends. I want to go to the store and buy every cookie, every flower, every friend, every spaceship, and every car that could ever take me to the moon. When I get older I want to buy a castle in... Switzerland. I heard it's so lovely there.",
  user_id: 1
)

Doc.create(
  title: "Friends",
  content: "Friends make me glad that I have some.",
  user_id: 1
)

Doc.create(
  title: "Teachers",
  content: "My health teacher smells of tuna. Maybe he ate that every day last week?",
  user_id: 1
)

Doc.create(
  title: "Weekends Are Happy",
  content: "Happy Meals are only kind of happy.",
  user_id: 1
)

30.times do
  title = Faker::Address.street_name.split[0]
  Doc.create(
    title: title,
    content: Faker::Lorem.paragraph(3),
    user_id: rand(2..10)
  )
end


