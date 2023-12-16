# frozen_string_literal: true

require 'rails_helper'

RSpec.describe IeStatement, type: :model do
  let(:user) { User.create(email: 'punit.jain@one.com', password: 'J#1234') }
  let(:income_1) { Income.new(name: 'Salary', amount: 1000) }
  let(:income_2) { Income.new(name: 'Bonus', amount: 200) }
  let(:expenditure_1) { Expenditure.new(name: 'Rent', amount: 600) }
  let(:expenditure_2) { Expenditure.new(name: 'Food', amount: 100) }
  let(:expenditure_3) { Expenditure.new(name: 'utility', amount: 100) }

  let(:ie_statement) do
    IeStatement.new(name: 'IE statement Dec 2023', description: 'Test Description', user:,
                    incomes: [income_1, income_2],
                    expenditures: [expenditure_1, expenditure_2, expenditure_3])
  end

  describe '#total_income' do
    subject { ie_statement.total_income }

    it { is_expected.to eq(1200) }
  end

  describe '#total_expenditure' do
    subject { ie_statement.total_expenditure }

    it { is_expected.to eq(800) }
  end

  describe '#disposable_income' do
    subject { ie_statement.disposable_income }

    it { is_expected.to eq(400) }
  end

  describe '#ratio' do
    subject { ie_statement.ratio }

    it { is_expected.to eq(66.67) }

    context 'when total_income is zero' do
      before do
        allow(ie_statement).to receive(:total_income).and_return(0)
      end

      it { is_expected.to eq(0) }
    end
  end

  describe '#grade' do
    subject { ie_statement.grade }

    it { is_expected.to eq('D') }

    context 'when ratio is between 0 and 10' do
      before do
        allow(ie_statement).to receive(:ratio).and_return(5)
      end

      it { is_expected.to eq('A') }
    end

    context 'when ratio is between 10 and 30' do
      before do
        allow(ie_statement).to receive(:ratio).and_return(20)
      end

      it { is_expected.to eq('B') }
    end

    context 'when ratio is between 30 and 50' do
      before do
        allow(ie_statement).to receive(:ratio).and_return(40)
      end

      it { is_expected.to eq('C') }
    end

    context 'when ratio is greater than 50' do
      before do
        allow(ie_statement).to receive(:ratio).and_return(60)
      end

      it { is_expected.to eq('D') }
    end
  end
end
