class SignUpPolicy < ApplicationPolicy
  class Scope < Struct.new(:iuser, :scope)

    def initialize(iuser)
      @iuser = iuser
    end

    def show?
      @user.master?
    end

    def resolve
      scope
    end
  end
end
