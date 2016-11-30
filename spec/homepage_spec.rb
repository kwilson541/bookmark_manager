require 'spec_helper'

RSpec.feature 'homepage', :type => :feature do

	DatabaseCleaner.strategy = :transaction
	DatabaseCleaner.clean_with(:truncation)
	
	scenario 'see links on homepage' do
		DatabaseCleaner.start
		Link.create(url: 'www.google.com', title: 'Google')
		visit '/links'
		expect(page.status_code).to eq 200
		
		within 'ul#links' do
			expect(page).to have_content('Google')
		end

		DatabaseCleaner.clean
		
	end

end
