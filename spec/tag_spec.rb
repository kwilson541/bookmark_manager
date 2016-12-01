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

	scenario 'allows user to submit multiple tags per link' do
		visit '/links/new'
		fill_in 'url', :with => 'http://www.imgur.com'
		fill_in 'title', :with => 'Imgur'
		fill_in 'tags', :with => 'funny, pictures'
		click_button 'Add Link'

		link = Link.first
  		expect(link.tags.map(&:name)).to include('funny', 'pictures')
	end	
end