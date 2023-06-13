require "rails_helper"

RSpec.describe "scientists show page" do
  before(:each) do 
    @lab_1 = Lab.create!(name: "laboratory1")
    @scientist_1 = @lab_1.scientists.create!(name: "smarty", specialty: "pharma", university: "UOR")
    @scientist_2 = @lab_1.scientists.create!(name: "genius", specialty: "physics", university: "ROR")
    @scientist_3 = @lab_1.scientists.create!(name: "smarty pants", specialty: "chemistry", university: "FOT")
    @experiment_1 = @scientist_1.experiments.create!(name: "secret project", objective: "classified", num_months: 48)
    @experiment_2 = @scientist_2.experiments.create!(name: "secret project", objective: "classified", num_months: 48)
    @experiment_3 = @scientist_1.experiments.create!(name: "project 2", objective: "make cool things", num_months: 20)
    @experiment_4 = @scientist_2.experiments.create!(name: "project 2", objective: "make cool things", num_months: 20)
  end
  it "can display scientist info" do
    visit "/scientists/#{@scientist_1.id}"
    expect(page).to have_content("Name: smarty")
    expect(page).to have_content("Specialty: pharma")
    expect(page).to have_content("University: UOR")
    expect(page).to have_content("Lab: laboratory1")
    expect(page).to have_content("Experiments: secret project\nproject 2")
  end
  it "can remove experiments" do
    visit "/scientists/#{@scientist_1.id}"
    expect(page).to have_content("Experiments: secret project\nproject 2")
    click_button "Remove project 2"
    expect(current_path).to eq("/scientists/#{@scientist_1.id}")
    expect(page).to have_content("Experiments: secret project")
    expect(page).to_not have_content("project 2")
    visit "/scientists/#{@scientist_2.id}"
    expect(page).to have_content("Experiments: secret project\nproject 2")

  end
end