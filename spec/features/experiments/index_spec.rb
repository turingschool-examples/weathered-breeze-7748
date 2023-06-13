require "rails_helper"

RSpec.describe "Experiment Index Page" do
  before(:each) do
    @lab1 = Lab.create!(name: "Kooky")
    @lab2 = Lab.create!(name: "Lame")

    @scientist1 = @lab1.scientists.create!(name: "Marie Curie", specialty: "radioactivity", university: "University of Paris")
    @scientist2 = @lab1.scientists.create!(name: "Jim Jimmy", specialty: "dogs", university: "University of Dogs")
    @scientist3 = @lab2.scientists.create!(name: "Roger", specialty: "gum", university: "University of Gum")


    @exp1 = Experiment.create!(name: "MINERvA", objective: "study neutrino reactions with five different nuclei", num_months: 11)
    @exp2 = Experiment.create!(name: "FruITl00ps", objective: "dont get them soggy", num_months: 7)
    @exp3 = Experiment.create!(name: "WeScience", objective: "We dont know", num_months: 5)
    @exp4 = Experiment.create!(name: "MorePower", objective: "How do Batteries Work", num_months: 6)
    @exp5 = Experiment.create!(name: "#Gone", objective: "Find my Dad", num_months: 9)


    @se1 = ScientistExperiment.create(scientist_id: @scientist1.id, experiment_id: @exp1.id)
    @se2 = ScientistExperiment.create(scientist_id: @scientist2.id, experiment_id: @exp2.id)
    @se3 = ScientistExperiment.create(scientist_id: @scientist2.id, experiment_id: @exp1.id)

  end
  it "shows all experiments LONGER than 6 months, listed from longest to shortest" do
    visit experiments_path
    expect(page).to have_content(@exp1.name)
    expect(page).to have_content(@exp5.name)
    expect(page).to have_content(@exp2.name)
    expect(page).to_not have_content(@exp3.name)
    expect(page).to_not have_content(@exp4.name)
  end
end