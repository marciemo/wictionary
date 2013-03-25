require 'spec_helper'

describe Definition do

  context 'validations' do
    it {should validate_presence_of :text}
    it {should validate_presence_of :part_of_speech}
  end

  context 'associations' do
    it {should belong_to :word}
  end

end