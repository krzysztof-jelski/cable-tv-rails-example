require 'rails_helper'

feature 'admin can vindicate user' do

  let!(:client) { create(:client) }
  let!(:subscription) { create(:subscription, client_id: client.id) }
  let!(:payment) { create(:payment, client_id: client.id, subscription_id: subscription.id) }

  scenario 'admin can visit client payments from user index' do
    visit clients_path
    click_link 'Payments'
    expect(page).to have_css('h1', text: 'Payments')
  end

  scenario "only selected user's payments are visible" do
    visit client_payments_path(client)
    expect(page).to have_css('td', text: payment.due_date)
  end

  context 'client is vindicatable' do

    scenario 'admin can vindicate client', js: true do
      visit client_payments_path(client)
      click_link 'Vindicate!!!'
      expect(page).to have_content('Vindication started')
    end
  end

end
