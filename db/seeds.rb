100.times do |n|
  Message.create!(
    title: Faker::Internet.unique.email,
    content: Faker::Address.unique.full_address,
  )
end
