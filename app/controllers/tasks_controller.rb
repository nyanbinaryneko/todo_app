class TasksController < ApplicationController
  before_filter :load_list

  def new
    @task = @list.tasks.new
  end

  def create
    @task = @list.tasks.new(task_params)

    if @task.save
      redirect_to @list
    else
      render :new
    end
  end

  def edit
    @task = @list.tasks.find(params[:id])
  end

  def update
    @task = @list.tasks.find(params[:id])

    if @task.update_attributes task_params
      redirect_to @list
    else
      render :edit
    end
  end

  def destroy
    @task = @list.tasks.find(params[:id]).destroy
    flash[:notice]= "Task deleted"
    redirect_to @list
  end

  private
  def load_list
    @list = List.find(params[:list_id])
  end

  def task_params
    params.require(:task).permit(:description, :status)
  end
end