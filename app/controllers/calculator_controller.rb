class CalculatorController < ApplicationController
  include Evaluate

  def index
  end

  def evalute
  	@result = execute(params[:input])
    render :index
  end
end