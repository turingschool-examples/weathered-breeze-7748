class ScientistExperimentsController < ApplicationController
  def destroy
    scientist_experiment = ScientistExperiment.destroy(experiment_id: params[:experiment_id], scientist_id: params[:id])
    scientist = Scientist.find_by(id: scientist_experiment.scientist_id)
    redirect_to "/scientists/#{scientist.id}"
  end
end