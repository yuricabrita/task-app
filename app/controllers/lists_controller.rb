class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @tasks = @list.tasks.paginate(page: params[:page], per_page: 5)
    if(params[:incomplete_tasks])
      @tasks = Task.where('complete = false AND list_id = ?', @list.id).paginate(page: params[:page], per_page: 5)
      @incomplete_tasks = params[:incomplete_tasks]
    end
    if(params[:completed_tasks])
      @tasks = Task.where('complete = true AND list_id = ?', @list.id).paginate(page: params[:page], per_page: 5)
      @completed_tasks = params[:completed_tasks]
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
