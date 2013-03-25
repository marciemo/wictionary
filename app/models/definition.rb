class Definition < ActiveRecord::Base
  validates :text, :part_of_speech, :presence => true
  belongs_to :word
end