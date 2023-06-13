class ScientistExperimentsController < ApplicationController
  def destroy
    scientist_experiment = ScientistExperiment.find(params[:id])
    scientist = Scientist.find_by(id: scientist_experiment.scientist_id)
    scientist_experiment.destroy
    redirect_to "/scientists/#{scientist.id}"
  end
end