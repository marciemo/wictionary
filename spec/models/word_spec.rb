require 'spec_helper'

describe Word do
    it {should allow_mass_assignment_of :entry}
    it {should allow_mass_assignment_of :definition}
  context 'validations' do
    it {should validate_presence_of :entry}
    it {should validate_presence_of :definition}
  end

end