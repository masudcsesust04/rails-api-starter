class TasksController < ApplicationController
  before_action :set_todo
  before_action :set_todo_task, only: %i[show update destroy]

  # GET /todos/:todo_id/tasks
  def index
    json_response(@todo.tasks)
  end

  # GET /todos/:todo_id/tasks/:id
  def show
    json_response(@task)
  end

  # POST /todos/:todo_id/tasks
  def create
    @todo.tasks.create!(task_params)
    json_response(@todo, :created)
  end

  # PUT /todos/:todo_id/tasks/:id
  def update
    @task.update(task_params)
    head :no_content
  end

  # DELETE /todos/:todo_id/tasks/:id
  def destroy
    @task.destroy
    head :no_content
  end

  private

  def task_params
    params.permit(:name, :description, :done)
  end

  def set_todo
    @todo = Todo.find(params[:todo_id])
  end

  def set_todo_task
    @task = @todo.tasks.find_by!(id: params[:id]) if @todo
  end
end
