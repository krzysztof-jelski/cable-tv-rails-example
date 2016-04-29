require 'rails_helper'

describe PaymentsController do
  describe '#index' do
    before { get :index }

    it 'returns status 200' do
      expect(response.status).to eq(200)
    end
  end
end
