feature 'a user can sign out' do

  scenario 'a user signs out' do
    sign_up_and_in
    visit '/links'
    expect(page).to have_content "Welcome esbaddeley@gmail.com"
    click_button('delete')
    expect(page).to have_content 'Please enter your email address and password'
  end

end
