require 'rails_helper'

RSpec.describe Experiment do
  before(:each) do 
    @lab_1 = Lab.create!(name: "laboratory1")
    @scientist_1 = @lab_1.scientists.create!(name: "smarty", specialty: "pharma", university: "UOR")
    @scientist_2 = @lab_1.scientists.create!(name: "genius", specialty: "physics", university: "ROR")
    @scientist_3 = @lab_1.scientists.create!(name: "smarty pants", specialty: "chemistry", university: "FOT")
    @experiment_1 = Experiment.create!(name: "secret project", objective: "classified", num_months: 9)
    @experiment_2 = Experiment.create!(name: "project 2", objective: "make cool things", num_months: 4)
    @experiment_3 = Experiment.create!(name: "project zeus", objective: "make compound", num_months: 8)
    @experiment_4 = Experiment.create!(name: "project posedion", objective: "make compounds again", num_months: 10)
    @science_experiment_1 = ScientistExperiment.create!(scientist: @scientist_1, experiment: @experiment_1)
    @science_experiment_2 = ScientistExperiment.create!(scientist: @scientist_2, experiment: @experiment_1)
    @science_experiment_3 = ScientistExperiment.create!(scientist: @scientist_1, experiment: @experiment_2)
    @science_experiment_4 = ScientistExperiment.create!(scientist: @scientist_3, experiment: @experiment_4)
  end
  describe "class methods" do
    it "#longer_than_6" do
      expect(Experiment.longer_than_6).to match_array([@experiment_4, @experiment_1, @experiment_3])
    end
  end
end