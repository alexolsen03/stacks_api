class StacksController < ApplicationController
  before_action :set_stack, only: [:show, :update, :destroy]

  # GET /stacks
  # GET /stacks.json
  def index
    #if(params[:stack_count].nil?)
      #@stacks = Stack.all
    #else
      @stacks = Stack.all.order(id: :desc).limit(5)

    render json: @stacks
  end

  # GET /stacks/1
  # GET /stacks/1.json
  def show
    render json: @stack
  end

  # POST /stacks
  # POST /stacks.json
  def create
    @stack = Stack.new(stack_params)

    if @stack.save
      render json: @stack, status: :created, location: @stack
    else
      render json: @stack.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /stacks/1
  # PATCH/PUT /stacks/1.json
  def update
    @stack = Stack.find(params[:id])

    if @stack.update(stack_params)
      head :no_content
    else
      render json: @stack.errors, status: :unprocessable_entity
    end
  end

  # DELETE /stacks/1
  # DELETE /stacks/1.json
  def destroy
    @stack.destroy

    head :no_content
  end

  private

    def set_stack
      @stack = Stack.find(params[:id])
    end

    def stack_params
      params.require(:stack).permit(:name, cards_attributes: [:id, :front_text, :back_text])
    end
end
