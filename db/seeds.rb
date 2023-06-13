# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
@lab_1 = Lab.create!(name: "laboratory1")
    @scientist_1 = @lab_1.scientists.create!(name: "smarty", specialty: "pharma", university: "UOR")
    @scientist_2 = @lab_1.scientists.create!(name: "genius", specialty: "physics", university: "ROR")
    @scientist_3 = @lab_1.scientists.create!(name: "smarty pants", specialty: "chemistry", university: "FOT")
    @experiment_1 = Experiment.create!(name: "secret project", objective: "classified", num_months: 9)
    @experiment_2 = Experiment.create!(name: "project 2", objective: "make cool things", num_months: 7)
    @experiment_3 = Experiment.create!(name: "project zeus", objective: "make compound", num_months: 8)
    @experiment_4 = Experiment.create!(name: "project posedion", objective: "make compounds again", num_months: 10)
    @science_experiment_1 = ScientistExperiment.create!(scientist: @scientist_1, experiment: @experiment_1)
    @science_experiment_2 = ScientistExperiment.create!(scientist: @scientist_2, experiment: @experiment_1)
    @science_experiment_3 = ScientistExperiment.create!(scientist: @scientist_1, experiment: @experiment_2)
    @science_experiment_4 = ScientistExperiment.create!(scientist: @scientist_3, experiment: @experiment_4)
    @science_experiment_5 = ScientistExperiment.create!(scientist: @scientist_2, experiment: @experiment_1)