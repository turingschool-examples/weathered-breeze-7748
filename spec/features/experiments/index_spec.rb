require "rails_helper"

describe "Experiment Index page" do
  before :each do
    @lab1 = Lab.create!(name: "The Lab")
    @lab2 = Lab.create!(name: "Lab 2")
    @scientist1 = Scientist.create!(name: "Eddie", specialty: "frogs", university: "The University of Colorado", lab_id: @lab1.id)
    @scientist2 = Scientist.create!(name: "jim", specialty: "worms", university: "Indiana University", lab_id: @lab1.id)
    @scientist3 = Scientist.create!(name: "bobby", specialty: "snakes", university: "CSU", lab_id: @lab1.id)
    @scientist4 = Scientist.create!(name: "skeeter", specialty: "dogs", university: "UT", lab_id: @lab2.id)
    @experiment1 = Experiment.create!(name: "ex 1", objective: "fun", num_months: 3)
    @experiment2 = Experiment.create!(name: "2", objective: "fun", num_months: 7)
    @experiment3 = Experiment.create!(name: "ex 3", objective: "fun", num_months: 22)
    @experiment4 = Experiment.create!(name: "ex 4", objective: "some", num_months: 5)
    @experiment5 = Experiment.create!(name: "ex 5", objective: "you", num_months: 8)
    @experiment6 = Experiment.create!(name: "ex 6", objective: "them", num_months: 48)
    @exp_sci1 = ExperimentsScientist.create!(experiment_id: @experiment1.id, scientist_id: @scientist1.id)
    @exp_sci2 = ExperimentsScientist.create!(experiment_id: @experiment2.id, scientist_id: @scientist2.id)
    @exp_sci3 = ExperimentsScientist.create!(experiment_id: @experiment3.id, scientist_id: @scientist3.id)
    @exp_sci4 = ExperimentsScientist.create!(experiment_id: @experiment4.id, scientist_id: @scientist4.id)
    @exp_sci5 = ExperimentsScientist.create!(experiment_id: @experiment5.id, scientist_id: @scientist1.id)
    @exp_sci6 = ExperimentsScientist.create!(experiment_id: @experiment6.id, scientist_id: @scientist2.id)
    
    visit "/experiments"
    save_and_open_page
  end




        #   User Story 3, Experiment Index Page

        # As a visitor
        # When I visit the experiment index page
        # I see the names of all long running experiments (longer than 6 months),
        # And I see the names are in descending order (longest to shortest)

  describe "As a visitor, when I visit the experiment index page" do
    it "displays the names of all long running experiments in descending order" do
      expect(page).to have_content(@experiment2.name)
      expect(page).to have_content(@experiment3.name)
      expect(page).to have_content(@experiment5.name)
      expect(page).to have_content(@experiment6.name)
      expect(page).to_not have_content(@experiment1.name)
    end
  end
end