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

User.create!(
    email: "brtz@music.com",
    password: "password",
  )

puts "2 fake users created ⭐️"



puts "Creating 2 fake profiles..."

Profile.create!(
  username: "Theleme Abbey",
  customer: false,
  user_id: User.first.id,
  )

Profile.create!(
  username: "Alice DVX",
  customer: true,
  user_id: User.second.id,
  )

Profile.create!(
  username: "BRTZ",
  customer: true,
  user_id: User.first.id,
  )

puts "2 fake profiles created ⭐️"


puts "creating One awesome projects"

Project.create!(

    name: "ABsee logo",
    customer_id: User.last.id,
    artist_id: User.first.id,
    brief: "make a cool logo for ABsee"
  )

Project.create!(

    name: "BRTZ new album",
    customer_id: User.last.id,
    artist_id: User.first.id,
    brief: "I need a visual for my next album"
  )

puts "it's gonna be alright"


puts "create version"

version_1 = Version.create!(
  project: Project.first,
  name: "version 0",
  )

version_2 = Version.create!(
  project: Project.last,
  name: "brief",
  )

version_3 = Version.create!(
  project: Project.last,
  name: "retour",
  )

version_4 = Version.create!(
  project: Project.last,
  name: "WIP",
  )


url_version = "app/assets/images/WIP1.png"
version_4.remote_photo_url = url_version
version_4.save!


puts "version created"

brief = Version.find_by name: "brief"
retour = Version.find_by name: "retour"
wip = Version.find_by name: "WIP"

puts "creating some commentaires"

comment_1 = Comment.create!(
    user: User.last,
    version: brief,
    description: "",
    validation: true
    )

comment_2 = Comment.create!(
    user: User.last,
    version: brief,
    description: "",
    validation: true
    )

comment_3 = Comment.create!(
    user: User.last,
    version: brief,
    description: "",
    validation: true
    )

comment_4 = Comment.create!(
    user: User.last,
    version: brief,
    description: "",
    validation: true
    )



url = "app/assets/images/breitz2.jpg"
comment_1.remote_image_url = url
comment_1.save!

url = "app/assets/images/breitz4.jpg"
comment_2.remote_image_url = url
comment_2.save!

url = "app/assets/images/breitz6.jpg"
comment_3.remote_image_url = url
comment_3.save!

url = "app/assets/images/ref3.jpg"
comment_4.remote_image_url = url
comment_4.save!


comment_7 = Comment.create!(
    user: User.first,
    version: retour,
    description: "",
    validation: true
    )

comment_7 = Comment.create!(
    user: User.first,
    version: retour,
    description: "",
    validation: true
    )

comment_8 = Comment.create!(
    user: User.first,
    version: retour,
    description: "",
    validation: true
    )

comment_9 = Comment.create!(
    user: User.first,
    version: retour,
    description: "",
    validation: true
    )

comment_10 = Comment.create!(
    user: User.first,
    version: retour,
    description: "",
    validation: true
    )

comment_11 = Comment.create!(
    user: User.first,
    version: retour,
    description: "",
    validation: true
    )

comment_12 = Comment.create!(
    user: User.first,
    version: retour,
    description: "je pense faire qqch de glitchy",
    validation: true
    )

url = "app/assets/images/ref10.jpg"
comment_7.remote_image_url = url
comment_7.save!

url = "app/assets/images/ref2.jpg"
comment_7.remote_image_url = url
comment_7.save!

url = "app/assets/images/ref3.jpg"
comment_8.remote_image_url = url
comment_8.save!

url = "app/assets/images/ref4.jpg"
comment_9.remote_image_url = url
comment_9.save!

url = "app/assets/images/ref5.gif"
comment_10.remote_image_url = url
comment_10.save!

url = "app/assets/images/ref6.gif"
comment_11.remote_image_url = url
comment_11.save!



comment_13 = Comment.create!(
    user: User.first,
    version: wip,
    description: "",
    validation: true
    )

comment_14 = Comment.create!(
    user: User.first,
    version: wip,
    description: "",
    validation: true
    )

comment_15 = Comment.create!(
    user: User.last,
    version: wip,
    description: "",
    validation: true
    )

comment_16 = Comment.create!(
    user: User.last,
    version: wip,
    description: "",
    validation: true
    )

url = "app/assets/images/ref7.jpg"
comment_13.remote_image_url = url
comment_13.save!

url = "app/assets/images/ref8.jpg"
comment_14.remote_image_url = url
comment_14.save!

url = "app/assets/images/ref9.jpg"
comment_15.remote_image_url = url
comment_15.save!

url = "app/assets/images/ref1.jpg"
comment_16.remote_image_url = url
comment_16.save!




puts "C'est fait!"
