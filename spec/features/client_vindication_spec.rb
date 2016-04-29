require 'rails_helper'

feature 'admin can vindicate user' do
  let!(:client) { create(:client) }

  scenario 'admin can visit client payments from user index' do
    visit clients_path
    click_link 'Payments'
    expect(page).to have_css('h1', text: 'Payments')
  end

  scenario 'admin can vindincate client' do
    visit client_payments_path(client)
    click_link 'Vindicate'
    expect(page).to 
  end

end
