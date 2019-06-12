feature 'User sign in' do

  let!(:user) do
    User.create(email: 'test@example.com',
                password: 'test_password',
                password_confirmation: 'test_password')
  end


  scenario 'a user can sign in' do
    sign_in(email: user.email,   password: user.password)
    expect(page).to have_content "Hello, #{user.email}"
  end

  scenario 'requires correct email' do
    sign_in(email: "incorrect@example.com", password: user.password)
    expect(current_path).to eq '/sessions'
    expect(page).to have_content 'The email or password is incorrect'
  end

  scenario 'requires correct password' do
    sign_in(email: user.email, password: "incorrect_password")
    expect(current_path).to eq '/sessions'
    expect(page).to have_content 'The email or password is incorrect'
  end
end
