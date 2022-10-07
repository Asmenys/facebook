# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create(password:"1234567", email: "user_one@gmail.com", lastName:"Anders", firstName:"Thom")
User.create(password:"1234567", email: "user_two@gmail.com", lastName: "Siom", firstName: "Dora")
Post.create(creator: User.first, body: "sample post lorem ipsum many words")

50.times do
  user = User.create(password: Faker::Internet.password(min_length: 7), email: Faker::Internet.email, firstName: Faker::Name.first_name, lastName: Faker::Name.last_name)
  10.times do
    user.posts.new(body: Faker::Quote.yoda).save
  end
end

User.all.each do |user|
  user_id_array = Array.new(4) {(Random.random_number*50).round}.uniq
  user_id_array.each do |user_id|
    unless user.friends.map(&:id).include?(user_id)
      Friendship.new(friendship_master_id: user_id, friendship_receiver: user).save
    end
  end
end

