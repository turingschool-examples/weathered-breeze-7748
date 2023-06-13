class ExperimentScientist < ApplicationRecord
  self.table_name = "experiments_scientists"
  belongs_to :experiment
  belongs_to :scientist
end
