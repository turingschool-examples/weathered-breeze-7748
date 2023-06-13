require "rails_helper"

RSpec.feature "Scientist Show Page", type: :feature do
  describe "visitor views scientist information" do
    it "displays scientist details and associated experiments" do
      lab = Lab.create!(name: "Fermilab")
      experiment1 = Experiment.create!(
        name: "MINERvA",
        objective: "study neutrino reactions with five different nuclei",
        num_months: 4
      )
      experiment2 = Experiment.create!(
        name: "Experiment 2",
        objective: "Objective 2",
        num_months: 6
      )
      scientist = Scientist.create!(
        name: "Marie Curie",
        specialty: "radioactivity",
        university: "University of Paris",
        lab: lab
      )
      scientist.experiments << experiment1
      scientist.experiments << experiment2

      visit scientist_path(scientist)

      expect(page).to have_content(scientist.name)
      expect(page).to have_content(scientist.specialty)
      expect(page).to have_content(scientist.university)
      expect(page).to have_content("Lab: #{lab.name}")
      expect(page).to have_content(experiment1.name)
      expect(page).to have_content(experiment2.name)

      #  User Story 2
      within(".experiments") do
        expect(page).to have_button("Remove", count: 2)
      end
    end
  end
end
