class AddExperimentIdToScientists < ActiveRecord::Migration[7.0]
  def change
    add_reference :scientists, :experiment, null: false, foreign_key: true
  end
end
