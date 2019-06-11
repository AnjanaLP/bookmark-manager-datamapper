def signup
  visit '/users/new'
  fill_in "Email", with: "anjana@example.com"
  fill_in "Password", with: "password123"
  click_button "Signup"
end
