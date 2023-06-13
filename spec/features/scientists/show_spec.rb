require "rails_helper"

RSpec.describe "scientists show page" do
  before(:each) do 
    @lab_1 = Lab.create!(name: "laboratory1")
    @scientist_1 = @lab_1.scientists.create!(name: "smarty", specialty: "pharma", university: "UOR")
    @scientist_2 = @lab_1.scientists.create!(name: "genius", specialty: "physics", university: "ROR")
    @scientist_3 = @lab_1.scientists.create!(name: "smarty pants", specialty: "chemistry", university: "FOT")
    @experiment_1 = @scientist_1.experiments.create!(name: "secret project", objective: "classified", num_months: 48)
    @experiment_2 = @scientist_2.experiments.create!(name: "secret project", objective: "classified", num_months: 48)
    @experiment_3 = @scientist_3.experiments.create!(name: "secret project", objective: "classified", num_months: 48)
  end
  it "can display scientist info" do
    visit "/scientists/#{@scientist_1.id}"
    expect(page).to have_content("Name: smarty")
    expect(page).to have_content("Specialty: pharma")
    expect(page).to have_content("University: UOR")
    expect(page).to have_content("Lab: laboratory1")
    expect(page).to have_content("Experiments: secret project")

  end
end