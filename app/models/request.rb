class Request < ActiveRecord::Base
  has_many :userrequests, dependent: :destroy
  has_many :users, through: :userrequests
  validates_presence_of :notes, :date
  default_scope { order('date ASC') }

end
