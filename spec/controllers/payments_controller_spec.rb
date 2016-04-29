require 'rails_helper'

describe PaymentsController do
  describe '#index' do
    let!(:client) { create(:client) }
    before { get :index, client_id: client.id }

    it 'returns status 200' do
      expect(response.status).to eq(200)
    end

    it 'assigns @payments of selected client' do
      expect(assigns(:payments)).to eq(client.payments)
    end
  end
end
