class ExperimentsController < ApplicationController
  def index
    @long_running_experiments = Experiment.over_six_months
  end
end