class Scientist < ApplicationRecord
  belongs_to :lab
  has_many :hypotheses
  has_many :experiments, through: :hypotheses
end