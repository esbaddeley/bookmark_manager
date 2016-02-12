def add_link(name, url, tags)
  click_button('Add Link')
  fill_in('Name', with: name)
  fill_in('URL', with: url)
  fill_in('Tag', with: tags)
  click_button('Submit')
end

def sign_up(email, password, password_confirmation)
  visit '/signup'
  fill_in('Email', with: email)
  fill_in('Password', with: password)
  fill_in('Password_confirmation', with: password_confirmation)
  click_button('Submit')
end
