# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
@lab1 = Lab.create!(name: "710labs")
    @lab2 = Lab.create!(name: "Dexter's Lab")

    @scientist1 = Scientist.create!(name: "Mike Jones", specialty: "Drank", university: "Houston", lab: @lab1)
    @scientist2 = Scientist.create!(name: "Sean Paul", specialty: "Dance", university: "South Harmon Institute of Tech", lab: @lab1)
    @scientist3 = Scientist.create!(name: "Bob Barker", specialty: "Price", university: "CU Boulder", lab: @lab1)
    @scientist4 = Scientist.create!(name: "Tom Hanks", specialty: "Love", university: "Alabama", lab: @lab2)
    
    @experiment1 = Experiment.create!(name: "Mentos and Diet Coke", objective: "Save the Planet", num_months: 10)
    @experiment2 = Experiment.create!(name: "Baking Soda Volcano", objective: "Educate children", num_months: 4)
    @experiment3 = Experiment.create!(name: "Project X", objective: "Party", num_months: 6)
    @experiment4 = Experiment.create!(name: "Wolverine", objective: "Make Claws", num_months: 18)
    # @experiment5 = Experiment.create!(name: "Science Fair", objective: "Make bubbles", num_months: 8)
  
    ScientistExperiment.create!(experiment: @experiment1, scientist: @scientist1)
    ScientistExperiment.create!(experiment: @experiment2, scientist: @scientist2)
    ScientistExperiment.create!(experiment: @experiment2, scientist: @scientist3)
    ScientistExperiment.create!(experiment: @experiment3, scientist: @scientist4)
    ScientistExperiment.create!(experiment: @experiment4, scientist: @scientist2)
    