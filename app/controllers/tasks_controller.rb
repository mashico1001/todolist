class TasksController < ApplicationController

  def index
    @tasks = Task.all
    @task = Task.new
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
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def done
  end

  private
  def task_params
    params.require(:task).permit(:title, :body, :deadline_at, :completion_at)
  end

end
