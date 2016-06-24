# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create!(firstname: "Thomas", lastname: "Charbonnel", birthdate: "1992-09-28", admin: true, status: 1, email: "thomas@charbonnel.eu", password: "poneyponey", password_confirmation: "poneyponey")
article = user.articles.create!(title: "Test d'article", content: "Les pingouins se sont pas des manchots !", description: "Un article qui traite des tests d'articles.")
user.offers.create!(title: "Stage chez Poneyland", content: "Qui n'aime pas les stages chez poneyland ?")

User.create!(firstname: "Nicolas", lastname: "Pasquet", birthdate: "1970-01-01", admin: false, status: 2, email: "nicolas.pasquet@ecp.fr", password: "co-construction", password_confirmation: "co-construction")
User.create!(firstname: "Solène", lastname: "Guillemot", birthdate: "1991-04-05", admin: true, status: 1, email: "solene.guillemet@centraliens.net", password: "paquerettes", password_confirmation: "paquerettes")

Comment.create!(article: article, user: user, content: "Ceci est un commentaire !")
