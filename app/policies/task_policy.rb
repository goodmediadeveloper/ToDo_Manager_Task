class TaskPolicy < ApplicationPolicy
  # class Scope < Scope
  #   def resolve
  #     if user.admin?
  #       scope.all
  #     else
  #       scope.where(published: true)
  #     end
  #   end
  # end
  # def update?
  #   return true if task.created_by == user.email
  # end
  attr_reader :user, :task

  def initialize(user, task)
    @user = user
    @task = task
  end

  # CRUD actions
  def index?
    return true if user.present?
  end
  def update?
    return true if user.email == task.created_by
  end

  def destroy?
    return true if user.email == task.created_by
  end
end
