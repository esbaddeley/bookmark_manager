require 'spec_helper'

# USER STORY ONE
# As a USER
# So that I can see the pages that are bookmarked
# I want to see a list of links to the bookmarked pages

feature 'List of website links' do

  scenario 'it displays links' do
    Link.create(url: 'http://www.patience-is-a-virtue.org/', name: 'Hold on...')
    vist '/links'
    expect(page.status_code).to eq 200
    within 'ul#links' do
      expect(page).to have_content('Hold on...')
    end
  end

end
