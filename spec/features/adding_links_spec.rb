require 'spec_helper'

# USER STORY TWO
# As a USER
# So that I can add to bookmarked pages list
# I want to save the links to pages I like to the list of bookmarks

feature 'Adding links' do

  scenario 'results in the /links page containing that link' do
    visit '/links'
    add_link('Point At Your Pointer', 'http://www.pointerpointer.com/', '')
    within 'ul#links' do
      expect(page).to have_content('Point At Your Pointer')
    end
  end

end
