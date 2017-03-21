class BudgetsController < ApplicationController

  def new
    @budget = Budget.new
  end
end
