feature 'Filtering by tags' do
  scenario 'filtering only display links with tags' do
    visit '/links'
    click_button('Add Link')
    fill_in('Name', with: 'Bubble Shooter')
    fill_in('URL', with: 'http://www.shooter-bubble.com')
    fill_in('Tag', with: 'bubbles')
    click_button('Submit')
    click_button('Add Link')
    fill_in('Name', with: 'Google')
    fill_in('URL', with: 'http://www.google.com')
    fill_in('Tag', with: 'Search')
    click_button('Submit')
    visit '/tags/bubbles'
    expect(page).to_not have_content('Google')
    expect(page).to have_content('Bubble Shooter')
  end

  scenario 'a user can add multiple tags to a link' do
    visit '/links'
    click_button('Add Link')
    fill_in('Name', with: 'Google')
    fill_in('URL', with: 'http://www.google.com')
    fill_in('Tag', with: 'search, engine')
    click_button('Submit')
    visit '/tags/engine'
    within 'ul#links' do
      expect(page).to have_content('Google')
    end
  end


end
