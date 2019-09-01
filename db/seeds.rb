# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!( name:  "John Done",
              email: "john@example.com",
              avatar: Faker::LoremFlickr.image(size: "200x200", search_terms: ['sport']), 
              password:                 "foobar",
              password_confirmation:    "foobar",
             )


6.times do |n|
  name  = Faker::DcComics.name 
  email = Faker::Internet.safe_email(name: name.split(" ").first.downcase)
  search_terms = ['fitness', 'sport', 'beach', 'avatar', 'Internet', 'China', 'office'].sample
  avatar = Faker::LoremFlickr.image(size: "200x200", search_terms: [search_terms])
  password = 'foobar' 
  User.create!( name: name,
                email:  email,
                avatar: avatar,
                password: password,
                password_confirmation:  password
  )
end

18.times do
  title = Faker::DcComics.title 
  description = Faker::GreekPhilosophers.quote #=> "Only the educated are free."

  event_date = Faker::Date.between(from: 15.days.ago, to: 90.days.from_now)
  location = Faker::Address.street_address + ', ' +
  Faker::Address.city
  creator_id = User.all.ids.sample

  event = Event.create!(
    title: title,
    description: description,
    event_date: event_date,
    location: location,
    creator_id: creator_id
  )
  Attendance.create!(
    attendee_id: creator_id,
    attended_event_id: event.id
  )
end

users = User.all

users.each do |u|
  attendee_id = u.id
  count = 0
  until count > 2 do 
    temp_id = Event.all.ids.sample
    if !User.find_by(id: attendee_id).attended_events.ids.include?(temp_id)
      attended_event_id = temp_id
      Attendance.create!(
        attendee_id: attendee_id,
        attended_event_id: attended_event_id
      )
      count += 1
    end

  end

end




