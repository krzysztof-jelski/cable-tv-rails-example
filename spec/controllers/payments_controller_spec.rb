require 'rails_helper'

describe PaymentsController do
  describe '#index' do
    let(:payments) { double(:payments) }
    let(:client) { double(:client, id: 1, payments: payments) }

    before do
      allow(Client).to receive(:find) { client }
      get :index, client_id: client.id
    end

    it 'returns status 200' do
      expect(response.status).to eq(200)
    end

    it 'assigns @payments of selected client' do
      expect(assigns(:payments)).to eq(client.payments)
    end
  end
end
