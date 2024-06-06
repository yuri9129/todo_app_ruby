class TasksController < ApplicationController

  def index
    @params = params
    @tasks = Task.all
    if params[:complete] == "1"
      @tasks = @tasks.completed
    else
      @tasks = @tasks.not_completed
    end
  end

  def new
    @task = Task.new
    @tags = Tag.all
  end

  def create
    @task = Task.new(task_params)
    @tags = Tag.all
    if @task.save
      redirect_to tasks_path, notice: 'Task was successfully created.'
    else
      render "new", alert: "There was a problem creating your task."
    end
  end

  def edit
    @task = Task.find(params[:id])
    @tags = Tag.all
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path, notice: 'Task was successfully updated.'
    else
      render "edit", alert: "There was a problem updating your task."
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, notice: 'Task was successfully destroyed.'
  end

  def complete
    @task = Task.find(params[:id])
    if @task.complete!
      flash[:notice] = "Task marked as complete."
    else
      flash[:alert] = "There was a problem marking your task as complete."
    end
    redirect_to tasks_path
  end

  private def task_params
    params.require(:task).permit(:title, :description, tag_ids: [])
  end
end
