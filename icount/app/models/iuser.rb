class Iuser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :assign_user_role

  def master?
    role == 'master'
  end

  def reguser?
    role == 'reguser'
  end

  private
    def assign_user_role
      self.role = 'reguser'
      self.save
    end
end
