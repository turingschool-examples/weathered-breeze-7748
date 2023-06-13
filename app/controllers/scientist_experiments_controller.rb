class ScientistExperimentsController < ApplicationController
  def destroy
    scientist_experiment = ScientistExperiment.find(params[:id])
    scientist_experiment.destroy
    scientist = Scientist.find_by(id: scientist_experiment.scientist_id)
    redirect_to "/scientists/#{scientist.id}"
  end
end