class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @tasks = Task.all
    authorize @tasks
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
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
