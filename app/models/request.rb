class Request < ActiveRecord::Base
  has_many :userrequests
  has_many :users, through: :userrequests
end
