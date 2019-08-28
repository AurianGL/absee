puts "destroying DB"

Comment.destroy_all
Project.destroy_all
User.destroy_all

puts "DB destroyed"


puts "Creating 2 fake users..."

User.create!(

      email: "aurian@artiste.com",
      password: "password",
    )

User.create!(
      email: "alice@direction-artistique.com",
      password: "password",
    )



puts "2 fake users created ⭐️"


puts "creating one awesome project"

Project.create!(

    name: "ABsee logo",
    customer_id: User.last.id,
    artist_id: User.first.id,
    brief: "make a cool logo for ABsee"


  )

puts "it's gonna be alright"


puts "create version"

Version.create!(

  project: Project.last,
  work_in_progress: "wip"

  )

puts "version created"


puts "creating some commentaires langues de putes"

Comment.create!(
    user: User.last,
    version: Version.last,
    description: "bof",
    #image_url: "https://imgur.com/gallery/2cQabj3"
    #validation: true


  )


puts "C'est fait!"
