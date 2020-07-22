# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project

- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 
      # Customer has_many :stores
      # Store has_many :indoor_plants

- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
      # Store belongs_to :customer
      # IndoorPlant belongs_to :store

- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
      # Customer has_many :indoor_plants, through: :customer_indoor_plant
      # IndoorPlant has_many :customers, through: :customer_indoor_plant

- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
      # Customer has_many :indoor_plants, through: :customer_indoor_plant
      # IndoorPlant has_many :customers, through: :customer_indoor_plant

- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
      # store.plants_sold
      # store.most_sold_plant
      # indoor_plant.buy

- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
      # Emails have to be unique.
      # Cash has to be greater than or equal to 0.
      # Store names have to be unique.
      # Indoor plant names have to be unique.

- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
      # /indoor_plants/#{plant.id}/buy
      # indoor_plant.buy

- [x] Include signup
      # Has FaceBook and email option for signup.

- [x] Include login
      # Has FaceBook and email option for login.

- [x] Include logout
      # Can successfull log out.

- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
      # Use FaceBook OmniAuth to signup and login.

- [x] Include nested resource show or index (URL e.g. users/2/recipes)
      # index => /customers/1/stores
      # show => /customers/1/stores/1

- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
      # new => /customers/1/stores/new

- [x] Include form display of validation errors (form URL e.g. /recipes/new)
      # Front-end validation checks.

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [ ] Views use partials if appropriate