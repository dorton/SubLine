class Schoolgrade < ActiveRecord::Base
  belongs_to :school
  belongs_to :grade
end
