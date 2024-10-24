require 'faker'


10.times do
  City.create(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
end


10.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.sentence,
    email: Faker::Internet.email,
    age: rand(18..65),
    city: City.all.sample 
  )
end


20.times do
  Gossip.create(
    title: Faker::Lorem.sentence(word_count: 3),
    content: Faker::Lorem.paragraph,
    user: User.all.sample 
  )
end


10.times do
  Tag.create(title: Faker::Lorem.word)
end


Gossip.all.each do |gossip|
  gossip.tags << Tag.all.sample(rand(1..3))
end


5.times do
  pm = PrivateMessage.create(
    content: Faker::Lorem.sentence,
    sender: User.all.sample
  )

  recipients = User.where.not(id: pm.sender.id).sample(rand(1..3)) 
  recipients.each do |recipient|
    PrivateMessageRecipient.create(private_message: pm, user: recipient)
  end
end
