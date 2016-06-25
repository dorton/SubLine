class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :usergrades
  has_many :grades, through: :usergrades
  has_many :userschools
  has_many :schools, through: :userschools
  has_many :usersubjects
  has_many :subjects, through: :usersubjects

end
