class Experiment < ApplicationRecord
  has_many :hypotheses
  has_many :scientists, through: :hypotheses
  has_many :labs, through: :scientists

  def self.long_running_exp
    where("num_months >= 6")
    .order("num_months DESC")
  end
end