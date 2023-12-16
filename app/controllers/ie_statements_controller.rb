# frozen_string_literal: true

class IeStatementsController < ApplicationController
  def index
    @ie_statements = current_user.ie_statements.includes(:incomes, :expenditures)
  end

  def new
    @ie_statement = current_user.ie_statements.new
    @ie_statement.incomes.build
    @ie_statement.expenditures.build
  end

  def create
    @ie_statement = current_user.ie_statements.new(ie_statement_params_for_create)
    if @ie_statement.save
      redirect_to ie_statements_path
    else
      render :new
    end
  end

  private

  def ie_statement_params_for_create
    params
      .require(:ie_statement)
      .permit(:name, :description,
              incomes_attributes: %i[name amount],
              expenditures_attributes: %i[name amount])
  end
end
