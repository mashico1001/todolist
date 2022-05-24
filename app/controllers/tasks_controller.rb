class TasksController < ApplicationController

  def index
    @task = Task.new

    @tasks = Task.where(completion_at:nil).where("deadline_at >= ?", Time.now).order(:deadline_at)
    @tasks_done = Task.where.not(completion_at:nil)
    @tasks_expired = Task.where(completion_at:nil).where("deadline_at <= ?", Time.now)
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to tasks_path
    else
      render :index
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  def done
    @now = Time.now
    @task = Task.find(params[:id])
    @task.update(completion_at: @now)
    redirect_to :action => "index"
  end

  private
  def task_params
    params.require(:task).permit(:title, :body, :deadline_at, :completion_at)
  end

end
