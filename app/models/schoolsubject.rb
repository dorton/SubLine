class Schoolsubject < ActiveRecord::Base
  belongs_to :school
  belongs_to :subject
end
