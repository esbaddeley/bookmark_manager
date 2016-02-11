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
  end


end
