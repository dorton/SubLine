class Subject < ActiveRecord::Base
  has_many :usersubjects
  has_many :users, through: :usersubjects
  has_many :schoolsubjects
  has_many :schools, through: :schoolsubjects
end
