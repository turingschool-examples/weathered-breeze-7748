class RemoveExperimentIdFromScientists < ActiveRecord::Migration[7.0]
  def change
    remove_column :scientists, :experiment_id, :bigint
  end
end

