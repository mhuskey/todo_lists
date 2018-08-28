class ItemsController < ApplicationController
  
  before_action :set_list
  before_action :set_item, except: :create
  
  def create
    @item = @list.items.create(item_params)
    if @item.save
      flash[:success] = "Todo item created"
    else
      flash[:danger]   = "Error creating todo item"
    end
    redirect_to @list
  end
  
  def destroy
    if @item.nil?
      redirect_to @list
    else
      if @item.destroy
        flash[:success] = "Todo item deleted"
      else
        flash[:danger]   = "Error deleting todo item"
      end
      redirect_to @list
    end
  end
  
  def complete
    @item.toggle_complete
    redirect_to @list
  end
  
  
  private
    
    def set_list
      @list = List.find(params[:list_id])
    end
    
    def set_item
      @item = @list.items.find_by(params[:id])
    end
    
    def item_params
      params[:item].permit(:task)
    end
    
end
