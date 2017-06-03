class TodosController < ApplicationController
  before_action :set_todo, only: %i[show update destroy]
  before_action :authenticate_request!

  # GET /todos
  def index
    @todos = Todo.paginate(page: params[:page], per_page: params[:per_page])
    json_response(@todos)
  end

  # POST /todos
  def create
    @todo = Todo.create!(todo_params)
    json_response(@todo, :created)
  end

  # GET /todos/:id
  def show
    json_response(@todo)
  end

  # PUT /todos/:id
  def update
    @todo.update(todo_params)
    head :no_content
  end

  # DELETE /todos/:id
  def destroy
    @todo.destroy
    head :no_content
  end

  private

  def todo_params
    # whitelist params
    params.require(:todo).permit(:title, :description, :created_by)
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end
end
