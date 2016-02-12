feature 'A user can sign in to the website' do

  scenario 'a user can sign in' do
    sign_in('esbaddeley@gmail.com', 'password',)
    expect(page.status_code).to eq 200
  end

  scenario 'a welcome message is displayed to the user' do
    sign_up('esbaddeley@gmail.com', 'password', 'password')
    sign_in('esbaddeley@gmail.com', 'password',)
    expect(page).to have_content "Welcome esbaddeley@gmail.com"
  end

  scenario 'entering a wrong password prevents log-in' do
    sign_up('esbaddeley@gmail.com', 'password', 'password')
    sign_in('esbaddeley@gmail.com', 'notapassword')
    expect(page).to have_content ('Username or password was entered incorrectly')
  end

  scenario 'entering an invalid email address prevents login' do
    sign_up('esbaddeley@gmail.com', 'password', 'password')
    sign_in('dog@gmail.com', 'password')
    expect(page).to have_content ('Username or password was entered incorrectly')
  end
end
