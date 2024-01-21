100.times do |n|
  Message.create!(
    title: Faker::Internet.unique.email,
    score: rand(0..100),
  )
end
