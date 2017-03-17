class AdminPolicy < ApplicationPolicy
  def show?
    record.admin_id == current_admin.id
  end
end
