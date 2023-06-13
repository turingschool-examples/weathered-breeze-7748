class Lab < ApplicationRecord
  has_many :scientists
  has_many :hypotheses, through: :scientists
  has_many :experiments, through: :hypotheses
end