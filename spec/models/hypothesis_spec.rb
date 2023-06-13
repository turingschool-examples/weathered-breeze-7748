require 'rails_helper'

RSpec.describe Hypothesis do
  it {should belong_to :scientist}
  it {should belong_to :experiment}
end