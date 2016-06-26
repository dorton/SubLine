class School < ActiveRecord::Base
  has_many :userschools
  has_many :users, through: :userschools
  has_many :schoolgrades
  has_many :grades, through: :schoolgrades
  has_many :schoolsubjects
  has_many :subjects, through: :schoolsubjects
end
