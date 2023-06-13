class Experiment < ApplicationRecord
  has_many :hypotheses
  has_many :scientists, through: :hypotheses
  has_many :labs, through: :scientists
end