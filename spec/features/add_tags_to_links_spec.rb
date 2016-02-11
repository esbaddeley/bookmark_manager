feature 'Adding tages to a link' do

  scenario 'A user can add a tag to a link when they create the link' do
    visit '/links'
    click_button('Add Link')
    expect(page).to have_content('Tag')
  end

  scenario 'when a user adds a tag it is added to the link' do
    visit '/links'
    click_button('Add Link')
    fill_in('Name', with: 'Google')
    fill_in('URL', with: 'http://www.google.com')
    fill_in('Tag', with: 'Search')
    click_button('Submit')
    within 'ul#links' do
      expect(page).to have_content('search')
    end
  end

  scenario 'a user can add multiple tags to a link' do
    visit '/links'
    click_button('Add Link')
    fill_in('Name', with: 'Google')
    fill_in('URL', with: 'http://www.google.com')
    fill_in('Tag', with: 'Search, Engine')
    click_button('Submit')
    within 'ul#links' do
      expect(page).to have_content('search')
      expect(page).to have_content('engine')
    end
  end


end
