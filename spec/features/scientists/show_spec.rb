require "rails_helper"

describe "Scientists show page" do
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
    


    visit "/scientists/#{@scientist1.id}"
    # save_and_open_page
  end



  # User Story 1, Scientist Show Page

  # As a visitor
  # When I visit a scientist's show page
  # I see all of that scientist's information including:
  #  - name
  #  - specialty
  #  - university where they got their degree
  # And I see the name of the lab where this scientist works
  # And I see the names of all of the experiments this scientist is running
  describe "When a visitor goes to a scientist's show page" do

    it "displays all of that scientist's information" do
      expect(page).to have_content("Scientist page")
      expect(page).to have_content(@scientist1.name)
      expect(page).to have_content(@scientist1.specialty)
      expect(page).to have_content(@scientist1.university)
      expect(page).to_not have_content(@scientist3.name)
    end

    it "displays the name of the lab where this scientist works" do
      expect(page).to have_content(@lab1.name)
      expect(page).to_not have_content(@lab2.name)
    end

    it "displays the names of all the experiments this scientist is running" do
      expect(page).to have_content(@experiment1.name)
      expect(page).to have_content(@experiment5.name)
      expect(page).to_not have_content(@experiment2.name)
    end

    #us 2 User Story 2, Remove an Experiment from a Scientist

    # As a visitor
    # When I visit a scientist's show page
    # Then next to each experiment's name, I see a button to remove that experiment from that scientist's work load
    # When I click that button for one experiment
    # I'm brought back to the scientist's show page
    # And I no longer see that experiment's name listed
    # And when I visit a different scientist's show page that is working on that same experiment,
    # Then I see that the experiment is still on the other scientist's work load

    it "displays next to each experiment's name a button to remove the experiment from that scientists work load" do
      expect(page).to have_button("Remove #{@experiment1.name} from #{@scientist1.name} page")
      expect(page).to have_button("Remove #{@experiment5.name} from #{@scientist1.name} page")
    end

    it "when click the button for one experiment brought back to the scientist's show page, experiment gone" do
      click_button("Remove #{@experiment1.name} from #{@scientist1.name} page")
      save_and_open_page
      expect(current_path).to eq("/scientists/#{@scientist1.id}")
      expect(page).to_not have_content(@experiment1.name)
      expect(page).to_not have_button("Remove #{@experiment1.name} from #{@scientist1.name} page")
    end

  end


end