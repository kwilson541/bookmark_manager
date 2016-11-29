require 'spec_helper'

RSpec.feature 'homepage', :type => :feature do
  scenario 'see links on homepage' do
    Link.create(url: 'www.google.com', title: 'Google')
    visit '/'
    expect(page.status_code).to eq 200
    

  end

end
