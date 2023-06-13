class Experiment < ApplicationRecord
  has_and_belongs_to_many :scientists
end
