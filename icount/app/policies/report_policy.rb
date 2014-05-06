class ReportPolicy < ApplicationPolicy
  attr_accesor :user, :report
  
  class Scope < Struct.new(:iuser, :scope)
    def resolve
      scope
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
      iuser.master?
#      if @user.master?
#        [:location]
#      else
#        [:description, :location]
#      end
    end    
  end
end
