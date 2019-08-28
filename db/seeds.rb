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

puts "destroying projects"

Project.destroy_all

puts "creating one awesome project"

Project.create!(

    name: "ABsee logo",
    customer_id: User.last.id,
    artist_id: User.first.id,
    brief: "make a cool logo for ABsee"
  )

puts "it's gonna be alright"
