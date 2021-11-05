class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @task_status = params[:task_status]
    if(@task_status)
      @tasks = @list.tasks.send(@task_status).paginate(page: params[:page], per_page: 5)
    else
      @tasks = @list.tasks.incompleted.paginate(page: params[:page], per_page: 5)
    end
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      flash[:success] = "List successfully added!"
      redirect_to list_url(@list)
    else
      render 'new'
    end
  end

  private

  def list_params
    params.require(:list).permit(:title)
  end
end
