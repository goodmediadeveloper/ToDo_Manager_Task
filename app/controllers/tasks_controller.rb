class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @q = Task.ransack(params[:q])
    @tasks = if !current_user.admin
               # @tasks = Task.all.find_all { |task| task.assignee == current_user.email}
               @q.result.find_all { |task| task.assignee == current_user.email }
             else
               # @tasks = Task.all.find_all { |task| task.created_by == current_user.email}
               @q.result.find_all { |task| task.created_by == current_user.email }
             end
  end

  def show
    @task = Task.find(params[:id])
    @current_user1 = @current_user
  end

  def edit
    @task = Task.find(params[:id])
    @status = [
      %w[0 ToDo],
      ['1', 'In Progress'],
      ['2', 'In Rewiew']
    ]
    @status.push(%w[3 Done]) if current_user.admin
  end

  def new
    @task = Task.new
    @users = []
    User.all.each do |user|
      @users.push([user.id, user.email]) unless user.admin
    end
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      # Сказать UserMailer отослать приветственное письмо после сохранения
      UserMailer.with(@task.assignee).welcome_email.deliver_later

      # format.html { redirect_to(@task, notice: 'User was successfully created.') }
      # format.json { render json: @task, status: :created, location: @task }
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
