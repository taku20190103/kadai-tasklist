class TasksController < ApplicationController
  # 念のためset_taskを追加しておきます。
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    
    if @task.save
      # flashメッセージは課題の要件にはありませんが、念のため実装します。
      flash[:success] = 'Taskが正常に保存されました'
      redirect_to @task
    else
      flash[:danger] = 'Taskが保存されませんでした'
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      # flashメッセージは課題の要件にはありませんが、念のため実装します。
      flash[:success] = 'Taskは正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Taskは更新されませんでした'
      render :edit
    end
  end

  def destroy
    @task.destroy
    
    # flashメッセージは課題の要件にはありませんが、念のため実装します。
    flash[:success] = 'Taskは正常に削除されました'
    redirect_to tasks_url
  end
  
  private
  
  # 念のためset_taskを追加しておきます。
  def set_task
    @task = Task.find(params[:id])
  end
  
  # Strong Parameterは課題の要件にはありませんが、念のため実装します。
  def task_params
    params.require(:task).permit(:content, :status)
  end
  
end
