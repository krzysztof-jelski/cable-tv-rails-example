require 'rails_helper'

describe Payment do
  describe '.overdue' do
    context 'overdue payments exist' do
      let!(:payment) { create(:payment, due_date: DateTime.current - 1.day) }

      it 'returns payment' do
        expect(described_class.overdue.count).to eq(1)
        expect(described_class.overdue.take).to eq(payment)
      end
    end

    context "overdue payments don't exist" do
      let!(:payment) { create(:payment, due_date: DateTime.current + 1.day) }
      it 'returns no payment' do
        expect(described_class.overdue.count).to eq(0)
      end
    end
  end
end
