class ListsController < ApplicationController
  
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def show
    @list = List.find(params[:id])
    
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end    
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy

    # no need for app/views/lists/destroy.html.erb
    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:name)
    # params.require(:name).require(:category).require(:address).permit(:phone_number)
  end

end
