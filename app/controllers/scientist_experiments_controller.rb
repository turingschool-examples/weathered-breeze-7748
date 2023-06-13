class ScientistExperimentsController < ApplicationController
  def destroy
    scientist_experiment = ScientistExperiment.find(params[:id])
    scientist_experiment.destroy
    redirect_to "/scientists/#{@scientist}"
  end
end