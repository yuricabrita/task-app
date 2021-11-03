# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |n|
    title = "Task #{n+1}"
    description = Faker::GreekPhilosophers.quote
    date_and_time = Faker::Time.forward(days: 5,  period: :evening, format: :long)
    Task.create!(title: title, description: description, date_and_time: date_and_time)
  end