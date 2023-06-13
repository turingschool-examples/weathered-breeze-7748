require "rails_helper"

RSpec.describe "Lab Show Page" do
  before(:each) do
    @lab1 = Lab.create!(name: "Kooky")
    @lab2 = Lab.create!(name: "Lame")

    @scientist1 = @lab1.scientists.create!(name: "Marie Curie", specialty: "radioactivity", university: "University of Paris")
    @scientist2 = @lab1.scientists.create!(name: "Jim Jimmy", specialty: "dogs", university: "University of Dogs")
    @scientist3 = @lab2.scientists.create!(name: "Roger", specialty: "gum", university: "University of Gum")


    @exp1 = Experiment.create!(name: "MINERvA", objective: "study neutrino reactions with five different nuclei", num_months: 4)
    @exp2 = Experiment.create!(name: "FruITl00ps", objective: "dont get them soggy", num_months: 4)
    @exp3 = Experiment.create!(name: "Dad?", objective: "Find Dad", num_months: 4)


    @se1 = ScientistExperiment.create(scientist_id: @scientist1.id, experiment_id: @exp1.id)
    @se2 = ScientistExperiment.create(scientist_id: @scientist2.id, experiment_id: @exp2.id)
    @se3 = ScientistExperiment.create(scientist_id: @scientist2.id, experiment_id: @exp1.id)

  end
  it "shows name, scientists that work here" do
    visit lab_path(@lab1)
    expect(page).to have_content(@lab1.name)
    expect(page).to have_content(@scientist1.name)
    expect(page).to have_content(@scientist2.name)
    expect(page).to have_content(@scientist1.num_exp)
    expect(page).to have_content(@scientist2.num_exp)
  end

end
