# frozen_string_literal: true

class Income < ApplicationRecord
  belongs_to :ie_statement

  validates :name, presence: true
  validates :amount, presence: true, numericality: true, comparison: { greater_than: 0 }
end
