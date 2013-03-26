class Word < ActiveRecord::Base
  attr_accessible :entry, :definition
  validates :entry, :definition, :presence => true
end