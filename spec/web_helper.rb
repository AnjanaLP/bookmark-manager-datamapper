def signup(email: "anjana@example.com", password: "password123", password_confirmation: "password123")
  visit '/users/new'
  fill_in "Email", with: email
  fill_in "Password", with: password
  fill_in "Password Confirmation", with: password_confirmation
  click_button "Signup"
end

def sign_in(email:, password:)
  visit '/sessions/new'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Sign in'
end
