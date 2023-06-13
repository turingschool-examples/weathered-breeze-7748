class HypothesesController < ApplicationController
  def destroy
    @hypothesis = Hypothesis.find_by(scientist_id: params[:id], experiment_id: params[:experiment_id])
    @hypothesis.destroy
    redirect_to "/scientists/#{params[:id]}"
  end
end