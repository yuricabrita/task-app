class TasksController < ApplicationController

    def index
        @tasks = Task.all
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

    private

    def task_params
      params.require(:task).permit(:title, :description, :date_and_time)
    end
end
