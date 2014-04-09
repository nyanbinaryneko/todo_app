class ListsController < ApplicationController
  def show
    @list = List.find(params[:id])
  end

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)

    if @list.save
      flash[:notice] = 'The list has been submitted.'
      redirect_to @list
    else
      render :new
    end
  end

  def destroy
    @list = List.find(params[:id]).destroy
    flash[:notice]= "List Deleted"
    redirect_to @list
  end

  private
  def list_params
    params.require(:list).permit(:name)
  end
end