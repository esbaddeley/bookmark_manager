require 'spec_helper'
require './app/models/link'

# USER STORY ONE
# As a USER
# So that I can see the pages that are bookmarked
# I want to see a list of links to the bookmarked pages

feature 'List of website links' do

  scenario 'it displays links' do
    sign_up_and_in
    Link.create(url: 'http://www.patience-is-a-virtue.org/', name: 'Hold on...')
    visit '/links'
    expect(page.status_code).to eq 200
    within 'ul#links' do
      expect(page).to have_content('Hold on...')
    end
  end

end
