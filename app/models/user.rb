class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :usergrades
  has_many :grades, through: :usergrades
  has_many :userschools
  has_many :schools, through: :userschools
  has_many :usersubjects
  has_many :subjects, through: :usersubjects
  has_many :userrequests
  has_many :requests, through: :userrequests



  def name
    "#{first_name} #{last_name}"
  end

  def role_label
    if self.super_admin?
      'Super Admin'
    elsif self.teacher?
      'Teacher'
    elsif self.substitute
      'Substitute'
    elsif self.admin?
      'Admin'
    end
  end

end
