class School < ActiveRecord::Base
  has_many :userschools
  has_many :users, through: :userschools
end
