class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    # render a new form (GET)
    @task = Task.new # Create new, empty instance
  end

  def edit
  end

  def update
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private
  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
  params.require(:task).permit(:title, :details, :completed)
  end
end
