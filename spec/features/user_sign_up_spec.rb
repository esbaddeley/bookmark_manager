feature 'User sign up' do

  scenario 'A user can sign up and user count increases' do
    visit '/signup'
    fill_in('Email', with: 'myemail@gmail.com')
    fill_in('Password', with: 'mysecurepassword')
    fill_in('Password_confirmation', with: 'mysecurepassword')
    click_button('Submit')
    expect(User.count).to eq 1
    expect(page).to have_content 'Welcome myemail'
  end

  scenario 'a user enters a mismatching password confirmation' do
    visit '/signup'
    fill_in('Email', with: 'myemail@gmail.com')
    fill_in('Password', with: 'mysecurepassword')
    fill_in('Password_confirmation', with: 'notmysecurepassword')
    click_button('Submit')
    expect(User.count).to eq 0
    expect(page).to have_content "Passwords entered do not match, please try again"
  end

  scenario 'check flash message not displayed on first page' do
    visit '/signup'
    expect(page).to_not have_content "Passwords entered do not match, please try again"
  end



end
