feature 'User sign out' do

  let!(:user) do
    User.create(email: 'test@example.com',
                password: 'test_password',
                password_confirmation: 'test_password')
  end


  scenario 'a signed in user can sign out' do
    sign_in(email: user.email,   password: user.password)
    click_button "Sign out"
    expect(page).not_to have_content "Hello, #{user.email}"
    expect(page).to have_content "You have succesfully signed out"
  end
end
