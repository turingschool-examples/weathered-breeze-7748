class ExperimentsController < ApplicationController
  def index
    @experiments = Experiment.where("num_months > ?", 6).order(num_months: :desc)
  end

  def show
    @experiment = Experiment.find(params[:id])
  end

  def new
    @experiment = Experiment.new
  end

  def create
    @experiment = Experiment.new(experiment_params)
    if @experiment.save
      redirect_to @experiment
    else
      render 'new'
    end
  end

  def remove_from_scientist
    @experiment = Experiment.find(params[:id])
    @scientist = Scientist.find(params[:scientist_id])
    @scientist.experiments.delete(@experiment)
    redirect_to scientist_path(@scientist)
  end

  private

  def experiment_params
    params.require(:experiment).permit(:name, :objective, :num_months)
  end
end
