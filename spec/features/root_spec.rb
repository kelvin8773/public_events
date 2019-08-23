require 'rails_helper'

RSpec.describe 'root path test', type: :feature do
  
  scenario 'login Fail Test' do
    visit login_path

    fill_in 'session[email]', with: 'kelvin@example.com'
    fill_in 'session[password]', with: 'foobar'
    click_button 'commit'

    expect(page).to have_content('This Emails is not register!')
  end

  # scenario 'login Success Test' do
  #   visit login_path

  #   fill_in 'session[email]', with: 'kelvin@example.com'
  #   fill_in 'session[password]', with: 'foobar'
  #   click_button 'commit'

  #   expect(page).to have_content('You are logged in!')
  # end

  

end