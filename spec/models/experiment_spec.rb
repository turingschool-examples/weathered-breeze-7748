require 'rails_helper'

RSpec.describe Experiment do
  it {should have_many(:hypotheses)}
  it {should have_many(:scientists).through(:hypotheses)}
  it {should have_many(:labs).through(:scientists)}
end