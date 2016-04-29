require 'rails_helper'

describe Client do

  describe '#vindicatable?' do
    let(:client) { create(:client) }
    let!(:payment2) { create(:payment, client: client, due_date: DateTime.now + 1.day) }
    let!(:payment3) { create(:payment, client: client) }
    let!(:payment4) { create(:payment, client: client) }

    subject { client.vindicatable? }

    context 'has overdue payments' do
      let!(:payment1) { create(:payment, client: client, due_date: DateTime.now - 181.days) }
      context 'overdue sum is over 1000' do
        let!(:subscription) { create(:subscription, price: '1001') }
        let!(:payment5) { create(:payment, client: client, due_date: DateTime.now - 1.day, subscription: subscription) }

        it { is_expected.to eq(true) }
      end
    end

    context "hasn't got any overdue payments" do
      it { is_expected.to eq(false) }
    end

  end
end
