require "rails_helper"

RSpec.describe "scientists show page" do
  before(:each) do 
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
    save_and_open_page
    click_button "Remove secret project"
    expect(current_path).to eq("/scientists/#{@scientist_1.id}")
    expect(page).to have_content("Experiments: project 2")
    expect(page).to_not have_content("secret project")
    visit "/scientists/#{@scientist_2.id}"
    expect(page).to have_content("Experiments: secret project\nproject 2")

  end
end