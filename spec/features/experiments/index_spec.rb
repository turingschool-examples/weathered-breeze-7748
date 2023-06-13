require "rails_helper"
RSpec.describe "experiments index page" do
  before(:each) do 
    @lab_1 = Lab.create!(name: "laboratory1")
    @scientist_1 = @lab_1.scientists.create!(name: "smarty", specialty: "pharma", university: "UOR")
    @scientist_2 = @lab_1.scientists.create!(name: "genius", specialty: "physics", university: "ROR")
    @scientist_3 = @lab_1.scientists.create!(name: "smarty pants", specialty: "chemistry", university: "FOT")
    @experiment_1 = @scientist_1.experiments.create!(name: "secret project", objective: "classified", num_months: 5)
    @experiment_2 = @scientist_2.experiments.create!(name: "secret project", objective: "classified", num_months: 5)
    @experiment_3 = @scientist_1.experiments.create!(name: "project 2", objective: "make cool things", num_months: 8)
    @experiment_4 = @scientist_2.experiments.create!(name: "project 2", objective: "make cool things", num_months: 8)
    @experiment_6 = @scientist_3.experiments.create!(name: "project zeus", objective: "make compound", num_months: 7)
  end
  it "can display all experiments longer than 6 months" do
    visit "/experiments"
    expect(page).to have_content("Name: project 2")
    expect(page).to have_content("Length: 8")
    expect(page).to have_content("Name: project zeus")
    expect(page).to have_content("Length: 7")
  end

end