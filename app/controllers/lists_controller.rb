class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @tasks = @list.tasks.paginate(page: params[:page], per_page: 5)
    @incomplete_tasks = params[:incomplete_tasks]
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      flash[:success] = "List successfully added!"
      redirect_to root_url
    else
      render 'new'
    end
  end

  private

  def list_params
    params.require(:list).permit(:title)
  end
end
