# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


u1 = User.create(username: 'user1')
u2 = User.create(username: 'user2')

a = Artwork.create(title: 'Art1', image_url: 'google.com', artist_id: u1.id)
a2= Artwork.create(title: 'Art2', image_url: 'google1.com', artist_id: u2.id)

v = ArtworkShare.create(artwork_id: a.id, viewer_id: u2.id)
v1 = ArtworkShare.create(artwork_id: a2.id, viewer_id: u1.id)

