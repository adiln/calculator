class CalculatorController < ApplicationController
  include Evaluate

  def index
  end

  def evaluate
  	@result = execute(params[:input])
    render :index
  end
end