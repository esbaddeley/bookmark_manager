feature 'Adding a link' do

  scenario 'a user can add a link' do
    visit '/links'
    click_button('Add a new link')
    expect(page).to have_content('Add a new link')
  end

  scenario 'a user can use the form to submit a link' do
    visit '/links/new'
    fill_in('Name', with: 'Github')
    fill_in('URL', with: 'http://github.com')
    click_button('Submit')
    within 'ul#links' do
      expect(page).to have_content('Github')
    end
  end

end
