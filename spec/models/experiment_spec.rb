require 'rails_helper'

RSpec.describe Experiment do
  before(:each) do 
    @lab_1 = Lab.create!(name: "laboratory1")
    @scientist_1 = @lab_1.scientists.create!(name: "smarty", specialty: "pharma", university: "UOR")
    @scientist_2 = @lab_1.scientists.create!(name: "genius", specialty: "physics", university: "ROR")
    @scientist_3 = @lab_1.scientists.create!(name: "smarty pants", specialty: "chemistry", university: "FOT")
    @experiment_1 = @scientist_1.experiments.create!(name: "secret project", objective: "classified", num_months: 9)
    @experiment_2 = @scientist_1.experiments.create!(name: "project 2", objective: "make cool things", num_months: 5)
    @experiment_3 = @scientist_2.experiments.create!(name: "project 2", objective: "make cool things", num_months: 5)
    @experiment_4 = @scientist_3.experiments.create!(name: "project zeus", objective: "make compound", num_months: 8)
    @experiment_5 = @scientist_3.experiments.create!(name: "project posedion", objective: "make compounds again", num_months: 10)
  end
  describe "class methods" do
    it "#longer_than_6" do
      expect(Experiment.longer_than_6).to match_array([@experiment_5, @experiment_1, @experiment_4])
    end
  end
end