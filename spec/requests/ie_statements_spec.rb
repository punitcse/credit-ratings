# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'IeStatements', type: :request do
  let(:user) { User.create!(email: 'some@mail.com', password: 'J#12345') }

  before(:each) do
    sign_in user
  end

  describe 'GET /index' do
    it 'returns http success' do
      get '/ie_statements/'
      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      get '/ie_statements/'
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /new' do
    it 'returns http success' do
      get '/ie_statements/new'
      expect(response).to have_http_status(:success)
    end

    it 'renders the new template' do
      get '/ie_statements/new'
      expect(response).to render_template(:new)
    end

    it 'assigns an instance variable to a new ie_statement' do
      get '/ie_statements/new'
      expect(assigns(:ie_statement)).to be_a_new(IeStatement)
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      let(:valid_params) do
        { ie_statement: { name: 'Test', description: 'Test Description',
                          incomes_attributes: [{ name: 'Salary', amount: 1000 }],
                          expenditures_attributes: [{ name: 'Rent', amount: 600 }] } }
      end

      it 'creates a new ie_statement in the database' do
        expect { post '/ie_statements', params: valid_params }.to change { IeStatement.count }.by(1)
      end

      it 'redirects to the ie_statements index' do
        post '/ie_statements', params: valid_params
        expect(response).to redirect_to(ie_statements_path)
      end
    end

    context 'with invalid parameters' do
      let(:invalid_params) do
        { ie_statement: { name: '', description: 'Test Description',
                          incomes_attributes: [{ name: 'Salary', amount: 1000 }],
                          expenditures_attributes: [{ name: 'Rent', amount: 600 }] } }
      end

      it "doesn't create a new ie_statement in the database" do
        expect { post '/ie_statements', params: invalid_params }.not_to(change { IeStatement.count })
      end

      it 'renders the new template' do
        post '/ie_statements', params: invalid_params
        expect(response).to render_template(:new)
      end
    end
  end
end
