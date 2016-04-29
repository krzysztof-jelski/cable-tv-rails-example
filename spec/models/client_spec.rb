require 'rails_helper'

describe Client do

  describe '#vindicatable?' do
    let(:client) { create(:client) }
    let!(:subscription) { create(:subscription) }
    let!(:payment2) { create(:payment, subscription: subscription, client: client, due_date: DateTime.now + 1.day) }
    let!(:payment3) { create(:payment, subscription: subscription, client: client) }
    let!(:payment4) { create(:payment, subscription: subscription, client: client) }

    subject { client.vindicatable? }

    context 'has overdue payments' do
      let!(:payment1) { create(:payment, client: client, subscription: subscription, due_date: DateTime.now - 181.days) }

      context 'overdue sum is over 1000' do
        let!(:subscription1) { create(:subscription, price: '1001') }
        let!(:payment5) { create(:payment, client: client, due_date: DateTime.now - 1.day, subscription: subscription1) }

        it { is_expected.to eq(true) }
      end

      context 'overdue sum is not over 1000' do
        let!(:subscription2) { create(:subscription, price: '100') }
        let!(:payment6) { create(:payment, client: client, due_date: DateTime.now - 1.day, subscription: subscription2) }

        it { is_expected.to eq(false) }
      end
    end

    context "hasn't got any overdue payments" do
      it { is_expected.to eq(false) }
    end

  end
end
