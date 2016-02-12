feature 'Filtering by tags' do
  scenario 'filtering only display links with tags' do
    sign_up_and_in
    visit '/links'
    add_link('Bubble Shooter','http://www.shooter-bubble.com', 'bubbles')
    add_link('Google', 'http://www.google.com', 'Search')
    visit '/tags/bubbles'
    expect(page).to_not have_content('Google')
    expect(page).to have_content('Bubble Shooter')
  end

  scenario 'a user can add multiple tags to a link' do
    sign_up_and_in
    visit '/links'
    add_link('Google', 'http://www.google.com', 'Search, Engine')
    visit '/tags/engine'
    within 'ul#links' do
      expect(page).to have_content('Google')
    end
  end


end
