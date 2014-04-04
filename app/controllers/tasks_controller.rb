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

  private
  def load_list
    @list = List.find(params[:list_id])
  end

  def task_params
    params.require(:task).permit(:description)
  end
end