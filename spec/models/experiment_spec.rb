require 'rails_helper'

RSpec.describe Experiment do
  it {should have_many(:scientist_experiments)}
  it {should have_many(:scientists).through(:scientist_experiments)}


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
  it "can find experiments longer than 6 months and arrange them in decending order" do
    expected = [@exp1, @exp5, @exp2]
    expect(Experiment.order_old).to eq(expected)
  end
end