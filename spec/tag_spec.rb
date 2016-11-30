require 'spec_helper'

RSpec.feature 'adding a new tag', :type => :feature do

	scenario 'allows user to submit a new tag' do
		visit '/links/new'
		fill_in 'url', :with => 'http://www.reddit.com'
		fill_in 'title', :with => 'Reddit'
		fill_in 'tags', :with => 'Lol'
		click_button 'Add Link'

		within 'ul#links' do
			expect(page).to have_content('Lol')
		end

	end	

end