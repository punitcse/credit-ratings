# frozen_string_literal: true

class CreateIncomes < ActiveRecord::Migration[7.0]
  def change
    create_table :incomes do |t|
      t.string :name
      t.decimal :amount
      t.references :ie_statement

      t.timestamps
    end
  end
end
