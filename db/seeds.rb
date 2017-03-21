# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Student.create!(name:  "Raphael",
             email: "raphael.ducatez@free.fr",
             password:              "auietsrn",
             password_confirmation: "auietsrn",
             admin: true)

Chapter.create!(name: "Espaces vectoriels")

ch=Chapter.find_by(name: "Espaces vectoriels")

exo=ch.exercices.create!(issue: "enonce000",
statement: '<p>Dans $ \mathbb{R}^3 $, le vecteur $(1,2,3)$ est il combinaison lineaire des vecteurs $(-2,3,1)$ et $(1,-1,0)$?</p>',
nature: 0,
answer: 7,
solution: "solution000"
)



