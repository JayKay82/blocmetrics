# Create a user
user = User.new(
  name: 'Jan',
  email: 'jankroezen@me.com',
  password: 'password',
  password_confirmation: 'password'
)
user.skip_confirmation!
user.save!

puts "#{User.count} users created."
