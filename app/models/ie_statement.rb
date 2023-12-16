# frozen_string_literal: true

class IeStatement < ApplicationRecord
  belongs_to :user
  has_many :incomes
  has_many :expenditures

  accepts_nested_attributes_for :incomes, :expenditures, allow_destroy: false

  validates :name, presence: true
  validates :user, presence: true
  validates :incomes, presence: true
  validates :expenditures, presence: true

  def disposable_income
    total_income - total_expenditure
  end

  def ratio
    return 0 if total_income.zero?

    ((total_expenditure.to_f / total_income) * 100).round(2)
  end

  def grade
    case ratio
    when 0..10
      'A'
    when 10..30
      'B'
    when 30..50
      'C'
    else
      'D'
    end
  end

  def total_income
    incomes.map.sum(&:amount).to_f
  end

  def total_expenditure
    expenditures.sum(&:amount).to_f
  end
end
