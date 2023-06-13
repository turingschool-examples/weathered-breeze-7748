class Experiment < ApplicationRecord
  has_many :experiments_scientists
  has_many :scientists, through: :experiments_scientists

  def self.long_run_experiments
    where('num_months >= 6').order(num_months: :desc).pluck(:name)
  end
end
