class Grade < ActiveRecord::Base
  has_many :usergrades
  has_many :users, through: :usergrades
end
