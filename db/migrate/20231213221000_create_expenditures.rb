# frozen_string_literal: true

class CreateExpenditures < ActiveRecord::Migration[7.0]
  def change
    create_table :expenditures do |t|
      t.string :name
      t.decimal :amount
      t.references :ie_statement

      t.timestamps
    end
  end
end
