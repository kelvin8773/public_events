require 'rails_helper'

RSpec.describe 'root path test', type: :feature do
  
  scenario 'sign in feature' do
    visit login_path

    fill_in 'inputEmail', with: 'kelvin@example.com'
    fill_in 'inputPassword', with: 'foobar'
    click_button 'Sign In'

    expect(page).to have_content('Hello, world!')
  end

  

end