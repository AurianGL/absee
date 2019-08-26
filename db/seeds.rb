puts "destroy users"

User.destroy_all

puts "Creating 2 fake users..."

User.create(

      email: "aurian@artiste.com",
      password: "password",
    )

User.create(
      email: "alice@direction-artistique.com",
      password: "password",
    )



puts "2 fake users created ⭐️"

