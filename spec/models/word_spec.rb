require 'spec_helper'

describe Word do

  context 'validations' do
    it {should validate_presence_of :entry}
  end

  context 'associations' do
    it {should have_many(:definitions)}
  end

end