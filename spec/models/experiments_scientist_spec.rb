require 'rails_helper'

RSpec.describe ExperimentsScientist, type: :model do
  it {should belong_to :scientist}
  it {should belong_to :experiment}
end
