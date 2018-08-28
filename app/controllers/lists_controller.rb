class ListsController < ApplicationController
  
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  
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
    if @list.update(list_params)
      flash[:success] = "List updated"
      redirect_to @list
    else
      render 'edit'
    end
  end
  
  def destroy
    @list.destroy
    flash[:success] = "Todo list deleted"
    redirect_to root_url
  end
  
  
  private
    
    def set_list
      @list = List.find(params[:id])
    end
    
    def list_params
      params.require(:list).permit(:title)
    end
    
end
