# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

1.times do |index|
  User.create!(email: "gullariz#{index}@gmail",
               user_name: "gullariz#{index}",
               password: 'gull123',
               bio: 'Web developer.',
               account_type_private: false)
end

1.times do |index|
  Post.create!(description: "this is description number#{index}",
               images.attach(io: File.open('app/assets/images/default_dp.jpg'))
end

# 10.times do |_index|
#   image_data = File.read('Instagram-Logo.png')
#   Story.create!(images: image_data)
# end
