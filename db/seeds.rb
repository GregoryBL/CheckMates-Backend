# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

bill = Bill.find_or_create_by(initiator_id: "1")

i1 = bill.items.find_or_create_by(item_description: "Eggs", price: 349)
i2 = bill.items.find_or_create_by(item_description: "Bacon", price: 2495)