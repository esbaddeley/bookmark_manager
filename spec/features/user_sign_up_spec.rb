feature 'User sign up' do

  scenario 'A user can sign up and user count increases' do
    expect{sign_up('myemail@gmail.com', 'mysecurepassword', 'mysecurepassword')}.to change(User, :count)
    expect(page).to have_content 'Welcome myemail'
  end

  scenario 'a user enters a mismatching password confirmation' do
    sign_up('myemail@gmail.com', 'mysecurepassword', 'notmysecurepassword')
    expect(User.count).to eq 0
    expect(page).to have_content "Passwords do not match, please try again"
  end

  scenario 'check flash message not displayed on first page at first visit' do
    visit '/signup'
    expect(page).to_not have_content "Passwords do not match, please try again"
  end

  scenario 'a user cannot sign up with a blank email address' do
    expect{sign_up('', 'mysecurepassword', 'mysecurepassword')}.not_to change(User, :count)
  end

  scenario 'a user cannot sign up with an incorrectly formatted email address' do
    expect{sign_up('bademail', 'mysecurepassword', 'mysecurepassword')}.not_to change(User, :count)
  end

  scenario 'the user has to enter a unique email address' do
    sign_up('name@gmail.com', 'securepassword', 'securepassword')
    expect {sign_up('name@gmail.com', 'securepassword', 'securepassword')}.not_to change(User, :count)
  end

  scenario 'the user has to enter a unique email address' do
    2.times {sign_up('name@gmail.com', 'securepassword', 'securepassword')}
    expect(page).to have_content 'Email is already taken'
  end

end
