require 'spec_helper'

RSpec.feature 'adding a bookmark', :type => :feature do

	scenario 'allows user to submit a new link' do
		visit '/links/new'
		fill_in 'url', :with => 'http://www.reddit.com'
		fill_in 'title', :with => 'Reddit'
		click_button 'Add Link'

		within 'ul#links' do
			expect(page).to have_content('Reddit')
		end

	end	

end