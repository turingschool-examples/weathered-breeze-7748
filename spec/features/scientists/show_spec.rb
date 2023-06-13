require "rails_helper"

RSpec.describe "Scientist's Show Page" do
  before :each do
    @lab1 = Lab.create!(name: "Not Pfizer")
    @lab2 = Lab.create!(name: "Dexter's Lab")

    @scientist1 = @lab1.scientists.create!(name: "Bilbo", specialty: "biology", university: "Hobbiton University")
    @scientist2 = @lab1.scientists.create!(name: "Frodo", specialty: "geology", university: "Hobbiton University")
    @scientist3 = @lab2.scientists.create!(name: "Steve Ballmer", specialty: "liquid sciences", university: "Microsoft University")
    @scientist4 = @lab2.scientists.create!(name: "Jeff Bezos", specialty: "money", university: "University of Amazon")

    @experiment1 = Experiment.create!(name: "Halfling Leaf", objective: "grow the best leaf in the shire", num_months: 75)
    @experiment2 = Experiment.create!(name: "bottle service", objective: "make the best gin to sell on amazon", num_months: 12)
    @experiment3 = Experiment.create!(name: "Infused Shire Brew", objective: "combine shire plants and steve ballmer alcohol", num_months: 3)

    @hypothesis1 = Hypothesis.create!(scientist_id: @scientist1.id, experiment_id: @experiment1.id)
    @hypothesis2 = Hypothesis.create!(scientist_id: @scientist2.id, experiment_id: @experiment1.id)
    @hypothesis3 = Hypothesis.create!(scientist_id: @scientist3.id, experiment_id: @experiment2.id)
    @hypothesis4 = Hypothesis.create!(scientist_id: @scientist4.id, experiment_id: @experiment2.id)
    @hypothesis5 = Hypothesis.create!(scientist_id: @scientist1.id, experiment_id: @experiment3.id)
    @hypothesis6 = Hypothesis.create!(scientist_id: @scientist2.id, experiment_id: @experiment3.id)
    @hypothesis7 = Hypothesis.create!(scientist_id: @scientist3.id, experiment_id: @experiment3.id)
    @hypothesis8 = Hypothesis.create!(scientist_id: @scientist4.id, experiment_id: @experiment3.id)
  end

  describe "scientist show page information" do
    it "shows scientist info with lab and experiment data" do
      # User Story 1, Scientist Show Page
      visit "/scientists/#{@scientist1.id}"

      expect(page).to have_content(@scientist1.name)
      expect(page).to have_content("Scientist Specialty: #{@scientist1.specialty}")
      expect(page).to have_content("Scientist University: #{@scientist1.university}")
      expect(page).to have_content("Scientist Lab: #{@lab1.name}")
      expect(page).to have_content("Experiment In Progress: #{@experiment1.name}")
      expect(page).to have_content("Experiment In Progress: #{@experiment3.name}")
    end

    it "removes experiment from scientist" do
      # User Story 2, Remove an Experiment from a Scientist
      visit "/scientists/#{@scientist1.id}"

      expect(page).to have_content(@experiment1.name)
      expect(page).to have_content(@experiment3.name)
      expect(page).to have_button "Remove #{@experiment1.name} Experiment From Scientist"
      click_button "Remove #{@experiment1.name} Experiment From Scientist"

      expect(current_path).to eq("/scientists/#{@scientist1.id}")
      expect(page).to have_content(@experiment3.name)
      expect(page).to_not have_content(@experiment1.name)
      
      visit "/scientists/#{@scientist2.id}"
      expect(page).to have_content(@experiment1.name)
    end
  end
end