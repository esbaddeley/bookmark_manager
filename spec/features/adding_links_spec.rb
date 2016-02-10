require 'spec_helper'

# USER STORY TWO
# As a USER
# So that I can add to bookmarked pages list
# I want to save the links to pages I like to the list of bookmarks

feature 'Adding links' do

  scenario 'results in the /links page containing that link' do
    visit '/links'
    click_button('Add Link')
    fill_in('Name', with: 'Point At Your Pointer')
    fill_in('URL', with: 'http://www.pointerpointer.com/')
    click_button('Submit')
    within 'ul#links' do
      expect(page).to have_content('Point At Your Pointer')
    end
  end

end
