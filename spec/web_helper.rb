def signup(email: "anjana@example.com", password: "password123", password_confirmation: "password123")
  visit '/users/new'
  fill_in "Email", with: email
  fill_in "Password", with: password
  fill_in "Password Confirmation", with: password_confirmation
  click_button "Signup"
end
