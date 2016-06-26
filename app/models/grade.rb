class Grade < ActiveRecord::Base
  has_many :usergrades
  has_many :users, through: :usergrades
  has_many :schoolgrades
  has_many :schools, through: :schoolgrades
end
