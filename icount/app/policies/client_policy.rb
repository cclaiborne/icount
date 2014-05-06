class ClientPolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
#      if iuser.master?
#        scope.all
#      else
      #  !scope.all
     # end
      #scope
    end
   end
   
  def initialize(iuser, report)
    @iuser = iuser
    @report = report
 end

  def create?
    true
  end

  def update?
    true
  end

  def show?
    false
#iuser.master?
#      if @user.master?                                                              
#        [:location]                                                                 
#      else                                                                          
#        [:description, :location]                                                   
#      end                                                                           
  end
end
