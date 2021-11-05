class TasksController < ApplicationController

  def index
    @tasks = Task.paginate(page: params[:page], per_page: 5)
  end

  def new
    @list_id = params[:list_id]
    @task = Task.new
    
  end

  def create
    @task = Task.new(task_params)
    @task.list_id = params[:list_id]
    if @task.save
      flash[:success] = "Task successfully added!"
      redirect_to list_url(params[:list_id])
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
      redirect_to list_url(@task.list_id)
    else
      render "edit"
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @assoc_list = @task.list_id
    @task.destroy
    flash[:success] = "Task deleted"
    redirect_to list_url(@assoc_list)
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

  def incompleted
    @incomplete_tasks = true
    redirect_to list_url(params[:list_id], incomplete_tasks: @incomplete_tasks)
  end

  def completed
    @completed_tasks = false
    redirect_to list_url(params[:list_id], completed_tasks: @completed_tasks)
  end


  private

  def task_params
    params.require(:task).permit(:title, :description, :date_and_time, :complete, :list_id)
  end
end
