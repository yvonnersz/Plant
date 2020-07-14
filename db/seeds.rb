succulent = Store.create!(name: "Succulent")
cactus = IndoorPlant.create!(name: "Cactus", price: 15, store_id: succulent.id, customer_id: yvonne.id)
yvonne = Customer.create!(name: "Yvonne")


