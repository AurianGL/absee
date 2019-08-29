puts "destroying DB"

ColorSwatch.destroy_all
Comment.destroy_all
Version.destroy_all
Project.destroy_all
Profile.destroy_all
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



puts "Creating 2 fake profiles..."

Profile.create!(
  username: "aurian GL",
  customer: false,
  user_id: User.first.id,
  )

Profile.create!(
  username: "alice dvx",
  customer: User.last.id,
  user_id: User.first.id,
  )

puts "2 fake profiles created ⭐️"


puts "creating one awesome project"

Project.create!(

    name: "ABsee logo",
    customer_id: User.last.id,
    artist_id: User.first.id,
    brief: "make a cool logo for ABsee"
  )

puts "it's gonna be alright"


puts "create version"

version = Version.new(
  project: Project.last,
  )

url_version = "https://images-na.ssl-images-amazon.com/images/I/71lBoP-NNGL._SX425_.jpg"
version.remote_photo_url = url_version
version.save!

puts "version created"


puts "creating some commentaires"

comment = Comment.new(
    user: User.last,
    version: Version.last,
    description: "bof",
    validation: true
    )
url = "https://images-na.ssl-images-amazon.com/images/I/71lBoP-NNGL._SX425_.jpg"
comment.remote_image_url = url
comment.save!


puts "C'est fait!"
