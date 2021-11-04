class TasksController < ApplicationController

  def index
    @tasks = Task.paginate(page: params[:page], per_page: 5)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = "Task successfully added!"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      flash[:success] = "Task updated"
      redirect_to root_url
    else
      render "edit"
    end
  end

  def destroy
    Task.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to tasks_url
  end

  def complete
    @task = Task.find(params[:id])
    if @task.update(complete: true)
      flash[:success] = "Task completed"
      redirect_back(fallback_location: root_path)
    else
      redirect_to root_url
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :date_and_time, :complete)
  end
end
