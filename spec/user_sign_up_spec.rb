require 'spec_helper'

RSpec.feature 'account sign up', :type => :feature do
	
	scenario 'a new user can sign up for an account' do
		sign_up
		expect(page).to have_current_path('/links')
		expect(page).to have_content('Welcome, user@domain.com!')
	end

	scenario 'user count increases when user signs up' do
		expect { sign_up }.to change(User, :count).by(1)
	end
end