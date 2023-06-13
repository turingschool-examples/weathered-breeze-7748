# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
@lab1 = Lab.create!(name: "The Lab")
@lab2 = Lab.create!(name: "Lab 2")
@scientist1 = Scientist.create!(name: "Eddie", specialty: "frogs", university: "The University of Colorado", lab_id: @lab1.id)
@scientist2 = Scientist.create!(name: "jim", specialty: "worms", university: "Indiana University", lab_id: @lab1.id)
@scientist3 = Scientist.create!(name: "bobby", specialty: "snakes", university: "CSU", lab_id: @lab1.id)
@scientist4 = Scientist.create!(name: "skeeter", specialty: "dogs", university: "UT", lab_id: @lab2.id)
@experiment1 = Experiment.create!(name: "ex 1", objective: "fun", num_months: 3)
@experiment2 = Experiment.create!(name: "2", objective: "fun", num_months: 7)
@experiment3 = Experiment.create!(name: "ex 3", objective: "fun", num_months: 22)
@experiment4 = Experiment.create!(name: "ex 4", objective: "some", num_months: 5)
@experiment5 = Experiment.create!(name: "ex 5", objective: "you", num_months: 8)
@experiment6 = Experiment.create!(name: "ex 6", objective: "them", num_months: 48)
@exp_sci1 = ExperimentsScientist.create!(experiment_id: @experiment1.id, scientist_id: @scientist1.id)
@exp_sci2 = ExperimentsScientist.create!(experiment_id: @experiment2.id, scientist_id: @scientist2.id)
@exp_sci3 = ExperimentsScientist.create!(experiment_id: @experiment3.id, scientist_id: @scientist3.id)
@exp_sci4 = ExperimentsScientist.create!(experiment_id: @experiment4.id, scientist_id: @scientist4.id)
@exp_sci5 = ExperimentsScientist.create!(experiment_id: @experiment5.id, scientist_id: @scientist1.id)
@exp_sci6 = ExperimentsScientist.create!(experiment_id: @experiment6.id, scientist_id: @scientist2.id)