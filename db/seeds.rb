# Create a user
user = User.new(
  name: 'Jan',
  email: 'jankroezen@me.com',
  password: 'password',
  password_confirmation: 'password'
)
user.skip_confirmation!
user.save!


# Create some registered applications
RegisteredApplication.create!(
  name: 'Blocipedia',
  url: 'jaykay-blocipedia.herokuapp.com',
  user: user
)

RegisteredApplication.create!(
  name: 'Blocitoff',
  url: 'jaykay-blocitoff.herokuapp.com',
  user: user
)
registered_applications = RegisteredApplication.all


# Create some associated events
events = Faker::Lorem.sentences(5)
100.times do
  Event.create!(
    name: events.sample,
    registered_application: registered_applications.sample
  )
end


# Log seed information to the console
puts "#{User.count} users created."
puts "#{RegisteredApplication.count} registered applications created."
puts "#{Event.count} events created."
