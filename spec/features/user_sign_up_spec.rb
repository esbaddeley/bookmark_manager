feature 'User sign up' do
  scenario 'A user can sign up and user count increases' do
    visit '/signup'
    fill_in('Email', with: 'myemail@gmail.com')
    fill_in('Password', with: 'mysecurepassword')
    click_button('Submit')
    expect(User.count).to eq 1
  end

  scenario 'A user can sign up and gets welcome message' do
    visit '/signup'
    fill_in('Email', with: 'myemail@gmail.com')
    fill_in('Password', with: 'mysecurepassword')
    click_button('Submit')
    expect(page).to have_content 'Welcome myemail'
  end
end
