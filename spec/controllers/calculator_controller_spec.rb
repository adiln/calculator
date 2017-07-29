require 'rails_helper'

RSpec.describe CalculatorController, type: :controller do

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'Post #evaluate' do
    before do
      post :evaluate, params: { input: "5*3+1+6/2+9*100" }
    end
    context 'evalute mathematical expression' do
      it 'should return result 919 for "5*3+1+6/2+9*100"' do
        expect(assigns(:result)).to eq(919)
      end
    end
  end

end
