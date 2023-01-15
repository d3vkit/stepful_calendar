# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

coach = Coach.create!(name: 'Splinter')
student = Student.create!(name: 'Michelangelo')

calendar = coach.create_calendar
avail = calendar.availabilities.create(start_time: 1.day.from_now, end_time: 1.day.from_now + 2.hours)
avail.create_appointment(student:)
