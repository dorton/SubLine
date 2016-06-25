class Subject < ActiveRecord::Base
  has_many :usersubjects
  has_many :users, through: :usersubjects
end
