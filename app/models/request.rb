class Request < ActiveRecord::Base
  has_many :userrequests, dependent: :destroy
  has_many :users, through: :userrequests
end
