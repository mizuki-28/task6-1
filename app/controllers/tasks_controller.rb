class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update, :destroy, :toggle]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
    redirect_to root_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:notice] = "スケジュールを更新しました"
      redirect_to root_path
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = "スケジュールを削除しました"
    redirect_to root_path, status: :see_other
  end

  private
  
  def task_params
    params.require(:task).permit(
      :title,
      :start_at,
      :end_at,
      :all_day,
      :memo
      )
  end

  def set_task
    @task = Task.find(params[:id])
  end

end
