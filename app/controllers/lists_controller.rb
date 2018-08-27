class ListsController < ApplicationController
  
  def index
    @lists = List.all
  end
  
  def show
    @list = List.find(params[:id])
  end
  
  def new
    @list = List.new
  end
  
  def edit
    @list = List.find(params[:id])
  end
  
  def create
    @list = List.create(list_params)
    if @list.save
      flash[:success] = "List successfully created"
      redirect_to @list
    else
      render 'new'
    end
  end
  
  def update
  end
  
  def destroy
    if @list = List.find(params[:id])
      @list.destroy
      flash[:success] = "Todo list deleted"
      redirect_to root_url
    else
      flash[:danger] = "Problem deleting list"
      redirect_to @list
    end
  end
  
  
  private
    
    def list_params
      params.require(:list).permit(:title)
    end
  
end
