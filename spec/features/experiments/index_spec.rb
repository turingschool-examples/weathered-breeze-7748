require "rails_helper"

RSpec.feature "Experiment Index Page", type: :feature do
  describe "visitor views long running experiments in descending order" do
    it "should show experiments in descending order" do
      experiment1 = Experiment.create!(
        name: "Experiment 1",
        objective: "Objective 1",
        num_months: 8
      )

      experiment2 = Experiment.create!(
        name: "Experiment 2",
        objective: "Objective 2",
        num_months: 10
      )

      experiment3 = Experiment.create!(
        name: "Experiment 3",
        objective: "Objective 3",
        num_months: 5
      )

      visit "/experiments"

      expect(page).to have_content("Experiment 2")
      expect(page).to have_content("Experiment 1")
      expect(page).not_to have_content("Experiment 3")
    end
  end
end
