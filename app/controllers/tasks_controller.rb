class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :update, :destroy]
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    # byebug
    @task = Task.new(task_params)
    if @task.save
      #OK
      redirect_to tasks_path, notice: "新增成功!"
    else
      #NG
      # byebug
      render :new
    end
  end

  def show
  end

  def edit
    # @task = Task.find_by(id: params[:id])
  end

  def update
    # @task = Task.find_by(id: params[:id])
    if @task.update_attributes(task_params)
      #OK
      redirect_to tasks_path, notice: "更新成功!"
    else
      #NG
      render :edit
    end
  end

  def destroy
    # @task = Task.find_by(id: params[:id])
    @task.destroy if @task
    redirect_to tasks_path, notice: "已刪除"
  end

  private

  def task_params
    # byebug
    params.require(:task).permit(:title, :description, :start_time, :end_time, :status, :priority)
  end

  def find_task
    @task = Task.find(params[:id])
  end
end
