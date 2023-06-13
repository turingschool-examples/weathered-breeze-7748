class ScientistExperimentsController < ApplicationController

  def destroy
    scientist = Scientist.find(params[:id])
    se = ScientistExperiment.find_by(scientist_id: params[:id], experiment_id: params[:format])
    se.destroy
    redirect_to scientist_path(scientist.id)
  end
end