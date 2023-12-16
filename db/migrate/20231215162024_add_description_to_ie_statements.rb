# frozen_string_literal: true

class AddDescriptionToIeStatements < ActiveRecord::Migration[7.0]
  def change
    add_column :ie_statements, :description, :string
  end
end
