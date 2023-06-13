require 'rails_helper'

RSpec.describe Scientist do
  describe "relationships" do
    it {should belong_to :lab}
    it {should have_many(:scientist_experiments)}
    it {should have_many(:experiments).through(:scientist_experiments)}
  end

  before(:each) do
    @lab1 = Lab.create!(name: "Kooky")
    @lab2 = Lab.create!(name: "Lame")

    @scientist1 = @lab1.scientists.create!(name: "Marie Curie", specialty: "radioactivity", university: "University of Paris")
    @scientist2 = @lab1.scientists.create!(name: "Jim Jimmy", specialty: "dogs", university: "University of Dogs")
    @scientist3 = @lab2.scientists.create!(name: "Roger", specialty: "gum", university: "University of Gum")


    @exp1 = Experiment.create!(name: "MINERvA", objective: "study neutrino reactions with five different nuclei", num_months: 4)
    @exp2 = Experiment.create!(name: "FruITl00ps", objective: "dont get them soggy", num_months: 4)


    @se1 = ScientistExperiment.create(scientist_id: @scientist1.id, experiment_id: @exp1.id)
    @se2 = ScientistExperiment.create(scientist_id: @scientist2.id, experiment_id: @exp2.id)
  end
  it "can find the lab it works for" do
    expect(@scientist1.experiment_list).to eq([@exp1])
  end

  it "can find its experiments" do
    expect(@scientist1.laboratory_name).to eq(@lab1.name)
  end
end

