feature 'User signup' do
  scenario 'a user can signup as a new user' do
    expect { signup }.to change(User, :count).by(1)
    expect(page).to have_content "Hello, anjana@example.com"
    expect(User.first.email).to eq "anjana@example.com"
  end

  scenario 'requires a matching password confirmation' do
    expect { signup(password_confirmation: "wrong_confirmation") }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content "Password does not match the confirmation"
  end

  scenario 'requires a non-blank email address' do
    expect { signup(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content "Email must not be blank"
  end

  scenario 'requires a valid email address' do
    expect { signup(email: "invalid@email") }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content "Email has an invalid format"
  end

  scenario 'requires a unique email address' do
    signup
    expect{ signup }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content "Email is already taken"
  end
end
