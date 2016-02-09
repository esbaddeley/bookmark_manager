feature 'display_link' do

  scenario 'a user can see a link' do
    Link.create(url: 'http://www.makersacademy.com', name: 'Makers Academy')
    visit '/links'
    within 'ul#links' do
      expect(page).to have_content('Makers Academy')
    end
  end

end
