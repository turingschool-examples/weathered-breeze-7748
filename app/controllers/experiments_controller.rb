class ExperimentsController < ApplicationController
  def index
    @experiments = Experiment.longer_than_6
  end
end