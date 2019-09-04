class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @q = Task.ransack(params[:q])
    if !current_user.admin
      # @tasks = Task.all.find_all { |task| task.assignee == current_user.email}
      @tasks = @q.result.find_all { |task| task.assignee == current_user.email}
    else
      # @tasks = Task.all.find_all { |task| task.created_by == current_user.email}
      @tasks = @q.result.find_all { |task| task.created_by == current_user.email}
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
    @status = [
      ['0', 'ToDo'],
      ['1', 'In Progress'],
      ['2', 'In Rewiew'],      
    ]
    if current_user.admin
      @status.push(['3', 'Done'])      
    end
  end

  def new
    @task = Task.new    
    @users = []
    User.all.each do |user|
      if !user.admin
        @users.push([user.id,user.email])
      end
    end
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to @task
    else
      render 'new'
    end
  end

  def update
    @task = Task.find(params[:id])
    authorize @task
    if @task.update(task_params)
      redirect_to @task
    else
      render 'edit'
    end
  end

  def destroy
    @task = Task.find(params[:id])
    authorize @task
    @task.destroy

    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:subject, :assignee, :status, :description, :created_by)
  end
end
