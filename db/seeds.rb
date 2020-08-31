user = User.find_by(email: "kerlak11@gmail.com")
unless user
  user = User.new
  user.email = "kerlak11@gmail.com"
  user.password = "sant@n4"
  user.password_confirmation = "sant@n4"
  user.confirmed_at = DateTime.now
  user.first_name = "Łukasz"
  user.last_name = "Kerl"
  user.phone = "+48728414809"
  user.confirm
  user.save(validate: false)
  puts "User #{user.email} created!"
  Role.all.each do |role|
    puts "Added #{role} role for #{user.email}" if user.add_role(role.name)
  end
end
