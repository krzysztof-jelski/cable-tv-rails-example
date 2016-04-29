require 'rails_helper'

feature 'admin can vindicate user' do

  scenario 'admin can visit client payments from user index' do
    visit clients_path
    click_link 'Payments'
    expect(page).to have_css('header h1', text: 'Payments')
  end

  scenario 'admin can vindincate client' do
    # visit 'clients/1/payments'

  end

end
