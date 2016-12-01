require 'spec_helper'

RSpec.feature 'filtering tags', :type => :feature do

    before(:each) do
        Link.create(url: 'http://www.google.com', title: 'Google', tags: [Tag.first_or_create(name: 'search engine')])
        Link.create(url: 'http://www.imgur.com', title: 'Imgur', tags: [Tag.first_or_create(name: 'funny')])
        Link.create(url: 'http://www.bubbleshooter.net', title: 'Bubble Shooter', tags: [Tag.first_or_create(name: 'bubbles')])
    end

    scenario 'links can be filtered by tags' do
        visit '/tags/bubbles'
        expect(page.status_code).to eq(200)

        within 'ul#links' do
            expect(page).not_to have_content('Google')
            expect(page).not_to have_content('Imgur')
            expect(page).to have_content('Bubble Shooter')
        end
    end
end