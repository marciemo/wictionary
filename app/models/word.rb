class Word < ActiveRecord::Base
  validates :entry, :presence => true
  has_many :definitions
end