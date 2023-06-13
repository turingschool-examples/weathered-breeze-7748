class Scientist < ApplicationRecord
  belongs_to :lab
  has_many :scientist_experiments
  has_many :experiments, through: :scientist_experiments


  def experiment_list
    self.experiments
  end

  def laboratory_name
    self.lab.name
  end

  def num_exp
    self.experiments.count
  end
end